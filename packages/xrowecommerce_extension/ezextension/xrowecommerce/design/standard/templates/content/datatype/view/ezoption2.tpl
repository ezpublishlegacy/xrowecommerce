{* DO NOT EDIT THIS FILE! Use an override template instead. *}
<label>{$attribute.content.name|wash( xhtml )}:</label>
{if $attribute.content.option_list}
<table class="list" cellspacing="0">
<tr>
    <th class="tight">&nbsp;</th>
    <th>{'No'|i18n( 'design/standard/content/datatype' )}</th>
    <th>{'Name'|i18n( 'design/standard/content/datatype' )}</th>
    <th>{'Description'|i18n( 'design/standard/content/datatype' )}</th>
    {section show=$attribute.is_information_collector|not}
        <th>{'Additional price'|i18n( 'design/standard/content/datatype' )}</th>
    {/section}
    <th>{'Weight'|i18n( 'design/standard/content/datatype' )}</th>
    <th>{'Image'|i18n( 'design/standard/content/datatype' )}</th>
</tr>

{foreach $attribute.content.option_list as $option}
<tr class="{$Options.sequence}">

{* Remove. *}
<td>
<input type="checkbox" name="eZOption[{$attribute.id}]" value="{$option.id}" title="{'Select option'|i18n( 'design/standard/content/datatype' )}" />
</td>

{* Option. *}
<td>{$option.value|wash}</td>

<td>{$option.comment|wash}</td>

{* Description. *}
<td>{$option.description|wash}</td>


{if $attribute.is_information_collector|not}
{* Price. *}
<td>

{def $multi_price = $option.multi_price
     $custom_price_list = $multi_price.custom_price_list
     $auto_price_list = $multi_price.auto_price_list
     $currency_list = $multi_price.auto_currency_list}
    {if or( count( $custom_price_list ), count( $auto_price_list ) )}
        <table class="list" cellspacing="0">
        <tr>
            <th>{'Currency'|i18n( 'design/standard/content/datatype' )}</th>
            <th>{'Value'|i18n( 'design/standard/content/datatype' )}</th>
        </tr>
            {foreach $auto_price_list as $index => $price}
            <tr>
                {* Currency *}
                <td>{$price.currency_code}</td>

                {* Value *}
                <td>{$price.value}({'Auto'|i18n( 'design/standard/content/datatype' )})</td>
            </tr>
            {/foreach}
            {foreach $custom_price_list as $price}
            <tr>
                {* Currency *}
                <td>{$price.currency_code}</td>

                {* Value *}
                <td>{$price.value}</td>
            </tr>
            {/foreach}
        </table>
    {else}
        {* Disabled 'remove' button *}
        <p>{'Price list is empty'|i18n( 'design/standard/content/datatype' )}</p>
    {/if}
</td>
{/if}
<td>{$option.weight}</td>
{* Object relation *}
<td>
{if and($option.image.content_class.identifier|eq('image'),$option.image|is_object)}
<div id="variation_image_div_{$attribute.id}_{$option.id}">
<a id="variation_image_link_{$attribute.id}_{$option.id}" href={$option.image.main_node.url_alias|ezurl()} target="_blank">{attribute_view_gui image_class=small attribute=$option.image.current.data_map.image}</a>
</div>
{else}
<div id="variation_noimage_div_{$attribute.id}_{$option.id}">{'No image'|i18n( 'design/standard/content/datatype' )}</div>
{/if}

</td></tr>
{/foreach}

</table>
{else}
<p>{'There are no options.'|i18n( 'design/standard/content/datatype' )}</p>
{/if}

<select name="eZOption[{$attribute.id}]">
{section var=Options loop=$attribute.content.option_list sequence=array( bglight, bgdark )}
    {section show=ne( $Options.item.additional_price, '' )}
        <option value="{$Options.item.id}">{$Options.item.value} {$Options.item.comment}{if $Options.item.additional_price|gt(0)} - {$Options.item.additional_price|l10n( currency )}{/if} - {$Options.item.weight}</option>
    {section-else}
        <option value="{$Options.item.id}">{$Options.item.value} {$Options.item.comment} - {$Options.item.weight}</option>
    {/section}
{/section}
</select>
{section-else}
<p>{'There are no options.'|i18n( 'design/standard/content/datatype' )}</p>
{/section}
