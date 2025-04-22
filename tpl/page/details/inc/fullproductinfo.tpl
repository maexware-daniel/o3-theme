[{if $oxcmp_shop->oxshops__oxproductive->value}]
    [{oxscript include="vendor/splide.min.js" priority=1}]
[{else}]
    [{oxscript include="vendor/splide.js" priority=1}]
[{/if}]

<div data-js="reload" itemscope itemtype="https://schema.org/Product">
    [{include file="page/details/inc/productmain.tpl"}]

    [{include file="page/details/inc/tabs.tpl"}]

    [{include file="page/details/inc/related_products.tpl"}]
</div>