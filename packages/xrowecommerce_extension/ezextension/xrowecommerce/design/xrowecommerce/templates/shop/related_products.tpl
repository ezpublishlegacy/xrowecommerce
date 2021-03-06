{def $related_purchase=fetch( 'shop', 'related_purchase', hash( 'contentobject_id', $node.object.id, 'limit', 4 ) )
     $price_display=ezini( 'Settings', 'ShowPriceAs', 'xrowecommerce.ini' )}
{if $related_purchase|count()|gt( 0 )}
<div class="related-xrow-products">
    <div class="horizontally_listed_sub_items">
        <h2>{'People who bought this also bought'|i18n( 'extension/xrowecommerce' )}</h2>
        <div class="border-box box-3">
            <div class="border-tl"><div class="border-tr"><div class="border-tc"></div></div></div>
            <div class="border-ml"><div class="border-mr"><div class="border-mc float-break">
                {foreach $related_purchase as $product}
                    <div class="related-product">
                        <div class="class-image">
                            <div class="content-image">
                                {if $product.data_map.image.content.is_valid}
                                    {attribute_view_gui href=$product.main_node.url_alias|ezurl() image_class="product_related" attribute=$product.data_map.image}
                                {else}
                                    <a href={$product.main_node.url_alias|ezurl('double', 'full')}>
                                        <img src={'shop/nopic_tiny.jpg'|ezimage()} alt="{'No image available'|i18n('extension/xrowecommerce')}" />
                                    </a>
                                {/if}
                            </div>
                        </div>
                        <div class="caption">
                            <p>{content_view_gui view=text_linked content_object=$product}</p>
                            <p class="price">
                                {if count($product.data_map.options.content.option_list)|gt( 0 )}
                                    {foreach $product.data_map.options.content.option_list as $Options}
                                        {if or( $Options.multi_price.$price_display|lt( $partprice ), is_set( $partprice )|not ) }
	                                        {def $partprice=get_multiprice( $product.data_map.price, $Options.multi_price, $price_display )}
	                                    {/if}
                                    {/foreach}
                                {/if}
                                {if $partprice|gt( 0 ) }
                                    <span class="currentprice"><small>{'starting at'|i18n('extension/xrowecommerce')}</small> {$partprice|l10n( currency )}</span>
                                {else}
                                    {$product.data_map.price.content.$price_display|l10n( currency )}
                                {/if}
                                {undef $partprice}
                            </p>
                        </div>
                    </div>
               {/foreach}
                <div class="break"></div>
            </div></div></div>
            <div class="border-bl"><div class="border-br"><div class="border-bc"></div></div></div>
        </div>
    </div>
</div>
{undef $related_purchase $price_display}
{/if}
