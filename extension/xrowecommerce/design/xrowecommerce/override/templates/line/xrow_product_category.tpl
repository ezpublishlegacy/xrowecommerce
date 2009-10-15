<div class="productline">
    <div class="product_title">
        <a href="{$node.url_alias|ezurl('no')}" title="{$node.name|wash()}"><h2>{$node.name|wash()}</h2></a>
    </div>
	<div class="productcategory-img">
		{if $node.data_map.image.has_content}
            <div class="productline-img">
				{attribute_view_gui image_class=small attribute=$node.data_map.image href=$node.url_alias|ezurl()}
			</div>
        {else}
            <div class="nopic"><a href="{$node.url_alias|ezurl('no')}"><img src={'nopic_130.gif'|ezimage()} alt="{'No image available'|i18n('extension/xrowecommerce')}" /></a></div>
		{/if}
	</div>
	<div class="productline-text">
		<p>{attribute_view_gui attribute=$node.data_map.description}&nbsp;</p>
		<p class="read_more"><a class="read_more" href={$node.url_alias|ezurl()} title="{$node.name|wash()}">{'read more'|i18n('extension/xrowecommerce')} »</a></p>
	</div>
</div>