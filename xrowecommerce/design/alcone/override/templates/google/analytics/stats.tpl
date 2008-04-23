{cache-block ignore_content_expiry expiry=0}
{* Google Analytics Page Statistics Tracking Template Code *}
{def $submit=ezini( 'GoogleAnalyticsWorkflow', 'PageSubmitToGoogle', 'googleanalytics.ini' )
     $uacct=ezini( 'GoogleAnalyticsWorkflow', 'Urchin', 'googleanalytics.ini' )
     $udn=ezini( 'GoogleAnalyticsWorkflow', 'HostName', 'googleanalytics.ini' )
     $js_url=ezini( 'GoogleAnalyticsWorkflow', 'Script', 'googleanalytics.ini' )}

{if and( eq( $submit, 'enabled' ), is_set( $udn ), is_set( $js_url ) )}<script src="{$js_url}" type="text/javascript"></script>
<script type="text/javascript">
 _uacct = "{$uacct}";

{if $udn|ne('disabled')} _udn="{$udn}";
{/if}
{literal} urchinTracker();{/literal}
</script>
{/if}
{/cache-block}
