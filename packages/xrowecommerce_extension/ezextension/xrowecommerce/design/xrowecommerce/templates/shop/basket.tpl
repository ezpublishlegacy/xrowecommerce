{def $cols=7}
{if ezini( 'Settings', 'ShowColumnRemove', 'xrowecommerce.ini')|ne('enabled')}
    {set $cols=$cols|sub(1)}
{/if}
{if ezini( 'Settings', 'ShowColumnPosition', 'xrowecommerce.ini')|ne('enabled')}
    {set $cols=$cols|sub(1)}
{/if}
{if ezini( 'Settings', 'ShowColumnTax', 'xrowecommerce.ini' )|ne('enabled')}
    {set $cols=$cols|sub(1)}
{/if}
{literal}
    <script type="text/javascript">
        removecheck_togglestate = 0;
        function toggleAll( element )
        {
            var checkref = document.basket.elements[element];
            if (!removecheck_togglestate)
            {
                for (i = 0; i < checkref.length; i++)
                {
                    checkref[i].checked = true ;
                }
                removecheck_togglestate = 1;
            } else
            {
                for (i = 0; i < checkref.length; i++)
                {
                    checkref[i].checked = false;
                }
                removecheck_togglestate = 0;
            }
        }
        function uncheckAll()
        {
        for (i = 0; i < field.length; i++)
                field[i].checked = false ;
        }
    </script>
{/literal}

<div class="shop shop-basket">

    <h1>{"Shopping Cart"|i18n("extension/xrowecommerce")}</h1>

    {include uri="design:shop/basket_navigator.tpl" step='1'}

    {if ezini( 'Settings', 'Catalogueorder', 'xrowecommerce.ini' )|eq('enabled')}
        {include uri="design:shop/basket_catalogue_order.tpl"}
        <h2>{"Shopping Cart"|i18n("extension/xrowecommerce")}</h2>
    {/if}
    {if $removed_items}
        <div class="warning">
            <h2>{"The following items were removed from your cart, because the products were changed"|i18n("extension/xrowecommerce",,)}</h2>
            <ul>
                {foreach $removed_items as $item}
                <li>
                    <a href={concat("/content/view/full/",$item.contentobject.main_node_id,"/")|ezurl}>
                        {$item.contentobject.name|wash}
                    </a>
                </li>
                {/foreach}
            </ul>
        </div>
     {/if}

    {if not( $vat_is_known )}
        <div class="message-warning">
            <h2>{'Tax is unknown'|i18n('extension/xrowecommerce')}</h2>
            {'Tax percentage is not yet known for some of the items being purchased.'|i18n( 'extension/xrowecommerce' )}
            {'This probably means that some information about you is not yet available and will be obtained during checkout.'|i18n( 'extension/xrowecommerce' )}
        </div>
    {/if}

    {section show=$error}
        <div class="error">
            {section show=$error|eq(1)}
                <h2>{"Attempted to add object without price to basket."|i18n("extension/xrowecommerce")}</h2>
            {/section}
        </div>
    {/section}

    {section show=$error}
        <div class="error">
            {section show=eq($error, "aborted")}
                <h2>{"Your payment was aborted."|i18n("extension/xrowecommerce")}</h2>
            {/section}
        </div>
    {/section}

    {if $basket.items}
        <form method="post" name="basket" action={"shop/basket/"|ezurl}>
            <input type="submit" class="hide" style="display: hide;" name="CheckoutButton" value="{'Checkout'|i18n( 'extension/xrowecommerce' )|wash()}" />

            {include uri="design:shop/basket_hint.tpl"}

            <div id="buttonblock-top" class="buttonblock">
                <input id="continue-shopping-button" class="button right-arrow" type="submit" name="ContinueShoppingButton" value="{'Continue shopping'|i18n("extension/xrowecommerce")}" title="{'Continue shopping'|i18n("extension/xrowecommerce")|wash}"/>
                <input id="empty-cart-button" type="button" onclick="empty_basket.submit();" class="button small-action" name="EmptyShoppingCartButton" value="{'Empty cart'|i18n( 'extension/xrowecommerce' )}" title="{'Use this button to empty your shopping cart.'|i18n( 'extension/xrowecommerce' )|wash}" />
                <input id="store-button" type="submit" class="button right-arrow " name="StoreChangesButton" value="{'Update'|i18n( 'extension/xrowecommerce' )|wash}" title="{'Use this button to update your shopping cart.'|i18n( 'extension/xrowecommerce' )|wash}" />
                <input id="checkout-button" type="submit" class="button right-arrow2 continue-button" name="CheckoutButton" value="{'Checkout'|i18n( 'extension/xrowecommerce' )|wash()}" title="{'Use this button to place your order.'|i18n( 'extension/xrowecommerce' )|wash}" />
            </div>

            {def $currency = fetch( 'shop', 'currency', hash( 'code', $basket.productcollection.currency_code ) )
                 $locale = false()
                 $symbol = false()}
            {if $currency}
                {set locale = $currency.locale
                     symbol = $currency.symbol}
            {/if}

            <div class="content-basket">
                <table class="order" summary="{'Basket items'|i18n("extension/xrowecommerce")}">
                    <tr class="lightbg">
                        {if ezini( 'Settings', 'ShowColumnPosition', 'xrowecommerce.ini' )|eq('enabled')}
                            <th class="position">
                                <abbr title="{"Position"|i18n("extension/xrowecommerce")}">{"Pos."|i18n("extension/xrowecommerce")}</abbr>
                            </th>
                        {/if}
                        <th>
                            {"Quantity"|i18n("extension/xrowecommerce")}
                        </th>
                        <th>
                            {"Item"|i18n("extension/xrowecommerce")}
                        </th>
                        {if and( eq(ezini( 'BasketInformation', 'DisplayTax', 'xrowecommerce.ini' ), 'enabled' ), ezini( 'Settings', 'ShowColumnTax', 'xrowecommerce.ini' )|eq('enabled') )}
                            <th>
                                {"Tax"|i18n("extension/xrowecommerce")}
                            </th>
                        {/if}
                        <th>
                            {"Unit price"|i18n("extension/xrowecommerce")}
                        </th>
                        <th class="totalprice">
                            {"Total price"|i18n("extension/xrowecommerce")}
                        </th>
                        {if ezini( 'Settings', 'ShowColumnRemove', 'xrowecommerce.ini')|eq('enabled')}
                        <th>
                            {"Delete"|i18n("extension/xrowecommerce")}
                        </th>
                        {/if}
                    </tr>

                    {foreach $basket.items as $key => $product_item sequence array(bglight,bgdark) as $sequence}
                        <tr class="{$sequence} product-line">

                            {if ezini( 'Settings', 'ShowColumnPosition', 'xrowecommerce.ini' )|eq('enabled')}
                                <td class="position">
                                    {$key|sum(1)}
                                </td>
                            {/if}

                            <td class="quantity">
                                <input type="hidden" name="ProductItemIDList[]" value="{$product_item.id}" />
                                <input class="quantity" type="text" name="ProductItemCountList[]" value="{$product_item.item_count}" size="5" maxlength="4" />
                            </td>
                            
                            <td class="cart_item">
                                {include uri="design:shop/product_cell_view.tpl" view="basket"}
                            </td>
                            
                            {if and( eq(ezini( 'BasketInformation', 'DisplayTax', 'xrowecommerce.ini' ), 'enabled' ), ezini( 'Settings', 'ShowColumnTax', 'xrowecommerce.ini' )|eq('enabled') )}
                                <td class="vat">
                                    {if ne( $product_item.vat_value, -1 )}
                                        {$product_item.vat_value} %
                                    {else}
                                        {'unknown'|i18n( 'extension/xrowecommerce' )}
                                    {/if}
                                </td>
                            {/if}

                            <td class="price">
                                {if eq(ezini( 'BasketInformation', 'ShowPricesIncludingTax', 'xrowecommerce.ini' ), 'enabled' )}
                                    {if $product_item.discount_percent}
                                        {def $discount = $product_item.price_inc_vat|div(100)|mul($product_item.discount_percent)
                                             $price = $product_item.price_inc_vat|sub($discount)}
                                    {else}
                                        {def $price = $product_item.price_inc_vat}
                                    {/if}
                                {else}
                                    {if $product_item.discount_percent}
                                        {def $discount = $product_item.price_ex_vat|div(100)|mul($product_item.discount_percent)
                                             $price = $product_item.price_ex_vat|sub($discount)}
                                    {else}
                                        {def $price = $product_item.price_ex_vat}
                                    {/if}
                                {/if}
                                {$price|l10n( 'currency', $locale, $symbol )}
                                {if is_set($discount)}{undef $discount}{/if}
                                {if is_set($price)}{undef $price}{/if}
                            </td>

                            <td class="totalprice">
                                {if eq(ezini( 'BasketInformation', 'ShowPricesIncludingTax', 'xrowecommerce.ini' ), 'enabled' )}
                                    {$product_item.total_price_inc_vat|l10n( 'currency', $locale, $symbol )}
                                {else}
                                    {$product_item.total_price_ex_vat|l10n( 'currency', $locale, $symbol )}
                                {/if}
                            </td>

                            {if ezini( 'Settings', 'ShowColumnRemove', 'xrowecommerce.ini')|eq('enabled')}
                                <td class="delete">
                                    <div class="basket_remove_item" id="basket_remove_item_{$product_item.id}">
                                        <input id="delete-button_{$product_item.id}" class="icon basket_remove_item" type="image" name="RemoveProductItemButton" src={'shop/basket-delete-icon.gif'|ezimage} value="{'Delete'|i18n( 'extension/xrowecommerce' )}" title="{'Use this button to remove items from your shopping cart.'|i18n( 'extension/xrowecommerce' )}" />
                                    </div>
                                    {literal}
                                        <script type="text/javascript">
                                            $(document).ready(function() {
                                                $("#delete-button_{/literal}{$product_item.id}{literal}").click(function() {
                                                    $('#basket_remove_item_{/literal}{$product_item.id}{literal}').append('<input type="hidden" name="RemoveProductItemDeleteList[]" value="{/literal}{$product_item.id}{literal}" />');
                                                });
                                            });
                                        </script>
                                    {/literal}
                                </td>
                            {/if}
                        </tr>
                    {/foreach}

                    {def $taxpercent = mul( div(sub($basket.total_inc_vat, $basket.total_ex_vat), $basket.total_ex_vat), 100)
                         $percentage = mul( div(sub($basket.total_inc_vat, $basket.total_ex_vat), $basket.total_ex_vat), 100)|l10n('number') }

                    {if is_set( $shipping_info )}
                        <tr>
                            <td class="product-subtotal" colspan="{if ezini( 'Settings', 'ShowColumnPosition', 'xrowecommerce.ini' )|eq('enabled')}{$cols|sub(1)}{else}{$cols|sub(2)}{/if}"><a href={$shipping_info.management_link|ezurl}>{'Shipping'|i18n( 'extension/xrowecommerce' )}{if $shipping_info.description} ({$shipping_info.description}){/if}</a>:
                                {$shipping_info.cost|l10n( 'currency', $locale, $symbol )}
                            </td>
                            <td class="product-subtotal">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="product-subtotal" colspan="{if ezini( 'Settings', 'ShowColumnPosition', 'xrowecommerce.ini' )|eq('enabled')}{$cols|sub(1)}{else}{$cols|sub(2)}{/if}"><strong>{'Order total'|i18n( 'extension/xrowecommerce' )}</strong>:
                                {$total_inc_shipping_inc_vat|l10n( 'currency', $locale, $symbol )}
                            </td>
                            <td class="product-subtotal">
                                &nbsp;
                            </td>
                        </tr>
                    {/if}
                    <tr class="subtotal-line">
                        <td colspan="{if ezini( 'Settings', 'ShowColumnPosition', 'xrowecommerce.ini' )|eq('enabled')}{$cols|sub(2)}{else}{$cols|sub(3)}{/if}" class="align_right">
                            {if eq(ezini( 'BasketInformation', 'ShowPricesIncludingTax', 'xrowecommerce.ini' ), 'enabled' )}
                                {"Subtotal inc. tax"|i18n("extension/xrowecommerce")}
                            {else}
                                {"Subtotal ex. tax"|i18n("extension/xrowecommerce")}
                            {/if}
                        </td>
                        <td class="totalprice">
                            <strong class="price">
                                {if eq(ezini( 'BasketInformation', 'ShowPricesIncludingTax', 'xrowecommerce.ini' ), 'enabled' )}
                                    {$basket.total_inc_vat|l10n( 'currency', $locale, $symbol )}
                                {else}
                                    {$basket.total_ex_vat|l10n( 'currency', $locale, $symbol )}
                                {/if}
                            </strong>
                        </td>
                        <td class="noborder"></td>
                    </tr>
                    {if eq(ezini( 'BasketInformation', 'DisplayShipping', 'xrowecommerce.ini' ), 'enabled' )}
                        <tr class="orderitem-line">
                            <td colspan="{if ezini( 'Settings', 'ShowColumnPosition', 'xrowecommerce.ini' )|eq('enabled')}{$cols|sub(2)}{else}{$cols|sub(3)}{/if}" class="align_right">
                                {"Estimated shipping and handling"|i18n("extension/xrowecommerce")}
                            </td>
                            <td class="price totalprice">
                                {if eq(ezini( 'BasketInformation', 'ShowPricesIncludingTax', 'xrowecommerce.ini' ), 'enabled' )}
                                    {$basket.items_info.additional_info.shipping_total.total_price_inc_vat|l10n( 'currency', $locale, $symbol )}
                                {else}
                                    {$basket.items_info.additional_info.shipping_total.total_price_ex_vat|l10n( 'currency', $locale, $symbol )}
                                {/if}
                            </td>
                            <td class="noborder">&nbsp;</td>
                        </tr>
                    {/if}
                    {if eq(ezini( 'BasketInformation', 'DisplayTax', 'xrowecommerce.ini' ), 'enabled' )}
                        <tr class="tax-line">
                            {def $colsub = 1}
                            {if ezini( 'Settings', 'ShowColumnPosition', 'xrowecommerce.ini' )|eq('enabled')}
                                {set $colsub = $colsub|inc}
                            {/if}
                            {if eq(ezini( 'BasketInformation', 'ShowPricesIncludingTax', 'xrowecommerce.ini' ), 'enabled' )}
                                {set $colsub = $colsub|sum(2)}
                            {/if}
                            <td colspan="{$cols|sub($colsub)}">
                                {if eq(ezini( 'BasketInformation', 'ShowPricesIncludingTax', 'xrowecommerce.ini' ), 'enabled' )}
                                    <i>{"Tax contained therein"|i18n("extension/xrowecommerce")}</i>
                                {else}
                                    {"Estimated Tax"|i18n("extension/xrowecommerce")}
                                {/if}
                            </td>
                            {if eq(ezini( 'BasketInformation', 'ShowPricesIncludingTax', 'xrowecommerce.ini' ), 'enabled' )}
                                <td colspan="2">({"net"|i18n("extension/xrowecommerce")} {$basket.total_ex_vat|l10n( 'currency', $locale, $symbol )})</td>
                            {/if}
                            <td class="price totalprice">
                                {if eq(ezini( 'BasketInformation', 'ShowPricesIncludingTax', 'xrowecommerce.ini' ), 'enabled' )}
                                    <i>
                                {/if}
                                {$basket.items_info.total_price_info.price_vat|l10n( 'currency', $locale, $symbol )}
                                {if eq(ezini( 'BasketInformation', 'ShowPricesIncludingTax', 'xrowecommerce.ini' ), 'enabled' )}
                                    </i>
                                {/if}
                            </td>
                            <td class="noborder">&nbsp;</td>
                        </tr>
                    {/if}
                    <tr class="grandtotal-line">
                        <td colspan="{if ezini( 'Settings', 'ShowColumnPosition', 'xrowecommerce.ini' )|eq('enabled')}{$cols|sub(2)}{else}{$cols|sub(3)}{/if}" class="align_right">
                            <strong>
                                {'Total'|i18n( 'extension/xrowecommerce' )}
                            </strong>
                        </td>
                        <td class="price totalprice">
                            <strong>
                                {$basket.total_inc_vat|l10n( 'currency', $locale, $symbol )}
                            </strong>
                        </td>
                        <td class="noborder">&nbsp;</td>
                    </tr>
                </table>
                <div id="buttonblock-bottom" class="buttonblock">
                    <input id="continue-shopping-button-2" class="button right-arrow" type="submit" name="ContinueShoppingButton" value="{'Continue shopping'|i18n("extension/xrowecommerce")}" title="{'Continue Shopping'|i18n("extension/xrowecommerce")}"/>
                    <input id="empty-cart-button-2" type="button" onclick="empty_basket.submit();" class="button small-action" name="EmptyShoppingCartButton" value="{'Empty Cart'|i18n( 'extension/xrowecommerce' )}" title="{'Use this button to empty your shopping cart.'|i18n( 'extension/xrowecommerce' )|wash}" />
                    <input id="store-button-2" type="submit" class="button right-arrow " name="StoreChangesButton" value="{'Update'|i18n( 'extension/xrowecommerce' )}" title="{'Use this button to update your shopping cart.'|i18n( 'extension/xrowecommerce' )|wash}" />
                    <input id="checkout-button-2" type="submit" class="button right-arrow2 continue-button" name="CheckoutButton" value="{'Checkout'|i18n( 'extension/xrowecommerce' )}" title="{'Use this button to place your order.'|i18n( 'extension/xrowecommerce' )|wash}" />
                </div>
            </div>
        </form>
        {undef $currency $locale $symbol}
        {include uri="design:shop/basket_hint_bottom.tpl"}
    {else}
        <div class="feedback">
            <form method="post" name="basket" action={"xrowecommerce/basket"|ezurl}>
                <p><strong>{"You have no items in your shopping cart"|i18n("extension/xrowecommerce")|wash()}</strong></p>
                <div class="buttonblock">
                    <input id="continue-button" class="button right-arrow " type="submit" name="ContinueShoppingButton" value="{'Continue shopping'|i18n("extension/xrowecommerce")}" />
                </div>
            </form>
        </div>
    {/if}
</div>

<form name="empty_basket" id="empty_basket" method="post" action={"shop/basket"|ezurl}>
    <input type="hidden" name="RemoveProductItemButton" value="RemoveProductItemButton" />
    {foreach $basket.items as $key => $product_item sequence array(bglight,bgdark) as $sequence}
        <input type="hidden" name="ProductItemIDList[]" value="{$product_item.id}" />
        <input type="hidden" name="RemoveProductItemDeleteList[]" value="{$product_item.id}" />
        <input class="quantity" type="hidden" name="ProductItemCountList[]" value="{$product_item.item_count}" size="3"/>
    {/foreach}
</form>
