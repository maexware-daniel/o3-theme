[{foreach from=$oView->getAttributes() item=oAttr name=attribute}]
    <div><span>[{$oAttr->title}]</span> [{$oAttr->value}]</div>
[{/foreach}]