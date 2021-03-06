<div class="shopping_cart_path">
    <div {if $step|eq('1')} class="shopping_cart_path_select"{/if}>
        1. {'Cart'|i18n('extension/xrowecommerce')}
    </div>
    <div {if $step|eq('2')} class="shopping_cart_path_select"{/if}>
        2. 
        {if ezini( 'Fields', 'Coupon', 'xrowecommerce.ini' ).enabled|eq('true')}
            {'Billing, Shipping and Coupons'|i18n('extension/xrowecommerce')}
        {else}
            {'Billing and Shipping'|i18n('extension/xrowecommerce')}
        {/if}
    </div>
    <div {if $step|eq('3')} class="shopping_cart_path_select"{/if}>
        3. {'Confirmation'|i18n('extension/xrowecommerce')}
    </div>
    <div {if $step|eq('4')} class="shopping_cart_path_select"{/if}>
        4. {'Payment'|i18n('extension/xrowecommerce')}
    </div>
    <div>
        5. {'Completion'|i18n('extension/xrowecommerce')}
    </div>
    {if ezini( 'ShopSettings', 'SendOrderEmail')|eq('enabled')}
        <div>
            6. {'Reciept'|i18n('extension/xrowecommerce')}
        </div>
    {/if}
</div>