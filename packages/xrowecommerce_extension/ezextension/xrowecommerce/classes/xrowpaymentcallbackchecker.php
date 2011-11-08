<?php

class xrowPaymentCallbackChecker
{

    /*!
        Constructor.
    */
    function __construct( $iniFile = 'site.ini' )
    {
        $this->logger = eZPaymentLogger::CreateForAdd( 'var/log/payment.log' );
        $this->ini = eZINI::instance( $iniFile );
    }

    /*!
        Parses 'POST' response and create array with received data.
    */
    function createDataFromPOST()
    {
        eZDebug::writeDebug( 'createDataFromPOST' );
        $this->callbackData = array();
        
        eZSys::removeMagicQuotes();
        foreach ( $_POST as $key => $value )
        {
            $this->callbackData[$key] = $value;
        }
        
        return ( count( $this->callbackData ) > 0 );
    }

    /*!
        Parses 'GET' response and create array with received data.
    */
    function createDataFromGET()
    {
        $this->callbackData = array();
        
        $query_string = eZSys::serverVariable( 'QUERY_STRING' );
        if ( $query_string )
        {
            $key_value_pairs = explode( '&', $query_string );
            
            foreach ( $key_value_pairs as $key_value )
            {
                $data = explode( '=', $key_value );
                $this->callbackData[$data[0]] = $data[1];
            }
        }
        
        return ( count( $this->callbackData ) > 0 );
    }

    /*!
        Sends POST request.
    */
    function sendPOSTRequest( $server, $port = 443, $request, $timeout = 30, $serverMethod = 'POST' )
    {
        $pos = strpos( $server, '://' );
        if ( $pos !== false )
        {
            $server = substr( $server, $pos + 3 );
        }
        if ( $port == 443 )
        {
            $fp = fsockopen( 'ssl://' . $server, $port, $errno, $errstr, $timeout );
        }
        else {
            $fp = fsockopen( $server, $port, $errno, $errstr, $timeout );
        }
        if( $serverMethod == 'POST' ){
        	$m = 'POST';
        }else {
        	$m = 'GET';
        }
        
        if ( $fp )
        {
            $theCall = "$m $request HTTP/1.0\r\n" . "Host: $server\r\n" . "Content-Type: application/x-www-form-urlencoded\r\n" . "Content-Length: " . strlen( $request ) . "\r\n" . "Connection: Close\r\n" . "\r\n" . $request . "\r\n\r\n";
            
            if ( ! fputs( $fp, "$theCall", strlen( $theCall ) ) )
            {
                eZDebug::writeError( "Could not write to server socket: $server:$port", 'send Request failed' );
                return null;
            }
            
            return $this->handleResponse( $fp );
        }
        
        eZDebug::writeError( "Unable to open socket on $server:$port. errno = $errno, errstr = $errstr", 'sendPOSTRequest failed' );
        return null;
    }

    /*!
        Asks paypal's server to validate callback.
    */
    function requestValidation()
    {
        return false;
    }

    /*!
        Creates order and payment objects by orderID.
        After this 'checkAmount', 'checkCurrency' can be called.
    */
    function setupOrderAndPaymentObject( $orderID )
    {
        if ( isset( $orderID ) && $orderID > 0 )
        {
            $this->paymentObject = xrowPaymentObject::fetchByOrderID( $orderID );
            if ( isset( $this->paymentObject ) )
            {
                $this->order = eZOrder::fetch( $orderID );
                if ( isset( $this->order ) )
                {
                    return true;
                }
                eZDebug::writeError( "Unable to fetch order object with orderID=$orderID", 'setupOrderAndPaymentObject failed' );
                return false;
            }
            eZDebug::writeError( "Unable to fetch payment object with orderID=$orderID", 'setupOrderAndPaymentObject failed' );
            return false;
        }
        eZDebug::writeError( "Invalid orderID=$orderID", 'setupOrderAndPaymentObject failed' );
        return false;
    }

    /*!
        Approves payment and continues workflow.
    */
    function approvePayment( $continueWorkflow = true )
    {
        eZDebug::writeDebug( "START" );
        if ( $this->paymentObject )
        {
            eZDebug::writeDebug( "before approve(" );
            $this->paymentObject->approve();
            eZDebug::writeDebug(   var_export($this->paymentObject, true). "before store(" );
            $this->paymentObject->store();

            eZDebug::writeDebug( 'payment was approved' );

            if ( $this->getFieldValue( 'custom' ) )
            {
                $data = unserialize( $this->getFieldValue( 'custom' ) );
                $workflowID = $data['process_id'];
            }
            eZDebug::writeDebug( " continueWorkflow( $workflowID" );
            return ( $continueWorkflow ? self::continueWorkflow( $workflowID ) : null );
        }
        eZDebug::writeError( "payment object is not set", 'approvePayment failed' );
        return null;
    }
    static function continueWorkflow( $workflowProcessID )
    {
        $operationResult =  null;
        $theProcess      = eZWorkflowProcess::fetch( $workflowProcessID );
        if ( $theProcess != null )
        {
            //restore memento and run it
            $bodyMemento = eZOperationMemento::fetchChild( $theProcess->attribute( 'memento_key' ) );
            if ( $bodyMemento === null )
            {
                eZDebug::writeError( $bodyMemento, "Empty body memento in workflow.php" );
                return $operationResult;
            }
            $bodyMementoData =  $bodyMemento->data();
            $mainMemento     = $bodyMemento->attribute( 'main_memento' );
            if ( !$mainMemento )
            {
                return $operationResult;
            }

            $mementoData = $bodyMemento->data();
            $mainMementoData = $mainMemento->data();
            $mementoData['main_memento'] = $mainMemento;
            $mementoData['skip_trigger'] = false;
            $mementoData['memento_key'] = $theProcess->attribute( 'memento_key' );
            $bodyMemento->remove();

            $operationParameters = array();
            if ( isset( $mementoData['parameters'] ) )
                $operationParameters = $mementoData['parameters'];
eZDebug::writeDebug(var_export( $mementoData, true ), __CLASS__ . "::" . __FUNCTION__ );
            $operationResult = eZOperationHandler::execute( $mementoData['module_name'],
                                                            $mementoData['operation_name'],
                                                            $operationParameters,
                                                            $mementoData );

            eZDebug::writeDebug(var_export( $operationResult, true ), __CLASS__ . "::" . __FUNCTION__ );
        }
        else 
        {
            eZDebug::writeError( "Continue Workflow failed", __CLASS__ . "::" . __FUNCTION__ );
        }
        return $operationResult;
    }

    /*!
        Returns value of specified field.
    */
    function getFieldValue( $field )
    {
        if ( isset( $this->callbackData[$field] ) )
        {
            return $this->callbackData[$field];
        }
        
        eZDebug::writeError( "field $field does not exist.", 'getFieldValue failed' );
        return null;
    }

    /*!
        Reads ip list from ini file and searches in it
        server's ip.
    */
    function checkServerIP()
    {
        $remoteHostIP = eZSys::serverVariable( 'REMOTE_ADDR' );
        $serverIPList = $this->ini->variable( 'ServerSettings', 'ServerIP' );
        
        if ( $serverIPList === false )
        {
            $this->logger->writeTimedString( "Skipped the IP check because ServerIP is not set in the settings. Remote host is: $remoteHostIP.", 'checkServerIP' );
            return true;
        }
        
        if ( is_array( $serverIPList ) && in_array( $remoteHostIP, $serverIPList ) )
        {
            return true;
        }
        
        $this->logger->writeTimedString( "server with ip = $remoteHostIP does not exist.", 'checkServerIP failed' );
        $this->logger->writeTimedString( $serverIPList, 'serverIPList from ini file is' );
        
        return false;
    }

    /*!
        Simple amount checking.
    */
    function checkAmount( $amount )
    {
        $orderAmount = $this->order->attribute( 'total_inc_vat' );
        
        // To avoid floating errors, round the value down before checking.
        $shopINI = eZINI::instance( 'shop.ini' );
        $precisionValue = (int) $shopINI->variable( 'MathSettings', 'RoundingPrecision' );
        if ( round( $orderAmount, $precisionValue ) === round( $amount, $precisionValue ) )
        {
            return true;
        }
        
        eZDebug::writeError( "Order amount ($orderAmount) and received amount ($amount) do not match.", 'checkAmount failed' );
        return false;
    }

    /*!
      Simple currency checking. It's up to the payment solution to use the currency that
      are set in the product collection for the order.
    */
    function checkCurrency( $currency )
    {
        //get the order currency
        $productCollection = $this->order->productCollection();
        $orderCurrency = $productCollection->attribute( 'currency_code' );
        
        if ( $orderCurrency == $currency )
        {
            return true;
        }
        
        eZDebug::writeError( "Order currency ($orderCurrency) and received currency ($currency).", 'checkCurrency failed' );
        return false;
    }

    function checkDataField( $field, $value )
    {
        $isValid = false;
        
        if ( isset( $this->callbackData[$field] ) )
        {
            $isValid = ( $this->callbackData[$field] == $value );
        }
        return $isValid;
    }

    // you must override below
    /*!
        Postback request which will be sent to payment server.
    */
    function buildRequestString()
    {
        throw new Exception( 'You must override this function.', 'buildRequestString failed' );
    }

    /* Handles server response.
    */
    function handleResponse( $socket )
    {
        throw new Exception( 'You must override this function.', 'handlePOSTResponse failed' );
    }
    
    public $logger;
    public $ini;
    public $callbackData;
    public $paymentObject;
    public $order;
}
