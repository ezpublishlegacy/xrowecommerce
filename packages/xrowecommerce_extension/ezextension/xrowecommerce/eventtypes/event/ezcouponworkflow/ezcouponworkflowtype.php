<?php

class eZCouponWorkflowType extends eZWorkflowEventType
{
    const WORKFLOW_TYPE_STRING = 'ezcouponworkflow';
    const STATE_CANCEL = 2;
    const STATE_INVALID_CODE = 3;
    const STATE_VALID_CODE = 1;
    const BASE = 'event_ezcoupon';

    /*!
     Constructor
    */
    function eZCouponWorkflowType()
    {
        $this->eZWorkflowEventType( eZCouponWorkflowType::WORKFLOW_TYPE_STRING, ezpI18n::tr( 'kernel/workflow/event', "Coupon" ) );
        $this->setTriggerTypes( array(
            'shop' => array(
                'confirmorder' => array(
                    'before' 
                )), 
            'recurringorders' => array(
                'checkout' => array(
                    'before'
                )
            )
        ) );
    }

    function execute( $process, $event )
    {
        $http = eZHTTPTool::instance();
        $this->fetchInput( $http, eZCouponWorkflowType::BASE, $event, $process );
        if ( $process->attribute( 'event_state' ) == eZCouponWorkflowType::STATE_CANCEL )
        {
            return eZWorkflowEventType::STATUS_ACCEPTED;
        }
        if ( $process->attribute( 'event_state' ) != eZCouponWorkflowType::STATE_VALID_CODE )
        {
            $process->Template = array();
            $process->Template['templateName'] = 'design:workflow/coupon.tpl';
            $process->Template['templateVars'] = array( 
                'process' => $process , 
                'event' => $event , 
                'base' => eZCouponWorkflowType::BASE 
            );
            
            return eZWorkflowType::STATUS_FETCH_TEMPLATE_REPEAT;
        
        }
        $ini = eZINI::instance( 'xrowcoupon.ini' );
        $coupon = new xrowCoupon( $event->attribute( "data_text1" ) );
        $attribute = $coupon->fetchAttribute();
        $data = $attribute->content();
        
        $description = $ini->variable( "CouponSettings", "Description" ) . " " . $event->attribute( "data_text1" );
        
        $parameters = $process->attribute( 'parameter_list' );
        $orderID = $parameters['order_id'];
        
        $order = eZOrder::fetch( $orderID );
        $orderItems = $order->attribute( 'order_items' );
        $addShipping = true;
        $newxml = new SimpleXMLElement( $order->attribute( 'data_text_1' ) );
        $shippintype = $newxml->shippingtype;
        foreach ( array_keys( $orderItems ) as $key )
        {
            $orderItem = & $orderItems[$key];
            if ( $orderItem->attribute( 'type' ) == "shippingcost" )
            {
                $shippingvalue = $orderItem->attribute( 'price' );
            }
            if ( $orderItem->attribute( 'description' ) == $description )
            {
                $addShipping = false;
                break;
            }
        }
        $shippingini = eZINI::instance( 'shipping.ini' );
        $shippinggateways = array();
        $shippinggateways = $shippingini->variable( "Settings", "FreeShippingHandlingGateways" );
        if ( (count( $shippinggateways ) != '0') AND ( $data['discount_type'] == ezCouponType::DISCOUNT_TYPE_FREE_SHIPPING ) AND ( !in_array($shippintype, $shippinggateways) ) )
        {
            $addShipping = false;
        }
        if ( $addShipping )
        {
            $price = 0;
            if ( $data['discount_type'] == ezCouponType::DISCOUNT_TYPE_FLAT )
            {
                $price = $data['discount'] * - 1;
            }
            elseif ( $data['discount_type'] == ezCouponType::DISCOUNT_TYPE_FREE_SHIPPING )
            {
                $price = $shippingvalue * - 1;
            }
            else
            {
                $price = $order->attribute( 'product_total_ex_vat' ) * $data['discount'] / 100 * - 1;
            }
            // Remove any existing order coupon before appending a new item
            $list = eZOrderItem::fetchListByType( $orderID, 'coupon' );
            if ( count( $list ) > 0 )
            {
                foreach ( $list as $item )
                {
                    $item->remove();
                }
            
            }
            $orderItem = new eZOrderItem( array( 
                'order_id' => $orderID , 
                'description' => $description , 
                'price' => $price , 
                'type' => 'coupon' , 
                'vat_is_included' => true , 
                'vat_type_id' => 1 
            ) );
            $orderItem->store();
        }
        
        return eZWorkflowEventType::STATUS_ACCEPTED;
    }

    function fetchInput( &$http, $base, &$event, &$process )
    {
        
        $var = $base . "_code_" . $event->attribute( "id" );
        $cancel = $base . "_CancelButton_" . $event->attribute( "id" );
        $select = $base . "_SelectButton_" . $event->attribute( "id" );
        if ( $http->hasPostVariable( $cancel ) and $http->postVariable( $cancel ) )
        {
            $process->setAttribute( 'event_state', eZCouponWorkflowType::STATE_CANCEL );
            return;
        }
        if ( $http->hasPostVariable( $var ) and $http->hasPostVariable( $select ) and count( $http->postVariable( $var ) ) > 0 )
        {
            $coupon = new xrowCoupon( $http->postVariable( $var ) );
            $event->setAttribute( "data_text1", $coupon->code );
            if ( $coupon->isValid() )
            {
                $process->setAttribute( 'event_state', eZCouponWorkflowType::STATE_VALID_CODE );
                return;
            }
            else
            {
                $process->setAttribute( 'event_state', eZCouponWorkflowType::STATE_INVALID_CODE );
                return;
            }
        }
        $parameters = $process->attribute( 'parameter_list' );
        
        $order = eZOrder::fetch( $parameters['order_id'] );
        if ( $order instanceof eZOrder )
        {
            $xml = new SimpleXMLElement( $order->attribute( 'data_text_1' ) );
            
            if ( $xml != null )
            {
                $code = (string) $xml->coupon_code;
                // we have an empty code this mean a coupon has been supplied at the user register page, so we cancle here
                if ( ! $code )
                {
                    $process->setAttribute( 'event_state', eZCouponWorkflowType::STATE_CANCEL );
                    return;
                }
                $coupon = new xrowCoupon( $code );
                if ( $coupon->isValid() )
                {
                    $process->setAttribute( 'event_state', eZCouponWorkflowType::STATE_VALID_CODE );
                    $event->setAttribute( "data_text1", $coupon->code );
                    return;
                }
                else
                {
                    $process->setAttribute( 'event_state', eZCouponWorkflowType::STATE_INVALID_CODE );
                    return;
                }
            }
        }
    }
}

eZWorkflowEventType::registerEventType( eZCouponWorkflowType::WORKFLOW_TYPE_STRING, "ezcouponworkflowtype" );

?>
