{* Link - Full view *}

<div class="content-view-listitem">
    <div class="class-link">

    {section show=$node.data_map.location.has_content}
        <div class="attribute-link">
            <p><a href="{$node.data_map.location.content}">{$node.data_map.name.content}</a></p>
        </div>
    {section-else}
        <p>{attribute_view_gui attribute=$node.data_map.name}</p>
    {/section}

    </div>
</div>