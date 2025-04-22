[{foreach from=$oxidBlock_sidebar item="_block"}]
    [{$_block}]
[{/foreach}]

[{block name="sidebar"}]

    [{if $content == "attributes"}]
        [{include file="widget/locator/attributes.tpl" attributes=$oView->getAttributes()}]
    [{/if}]

    [{if $content == "account"}]
        [{include file="page/account/inc/account_menu.tpl" active_link=$active_link}]
    [{/if}]

    [{block name="sidebar_categoriestree"}][{/block}]

    [{block name="sidebar_tags"}][{/block}]

    [{block name="sidebar_partners"}][{/block}]

    [{block name="sidebar_boxproducts"}][{/block}]

    [{block name="sidebar_recommendation"}][{/block}]

    [{block name="sidebar_news"}][{/block}]

    [{block name="sidebar_social"}][{/block}]

    [{block name="sidebar_shopluperatings"}][{/block}]
[{/block}]

