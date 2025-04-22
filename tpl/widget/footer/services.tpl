[{block name="footer_services"}]

    [{block name="footer_services_items"}]
        <div><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=contact"}]">[{oxmultilang ident="CONTACT"}]</a></div>
        [{if $oViewConf->getViewThemeParam('blFooterShowHelp')}]
            <div><a href="[{$oViewConf->getHelpPageLink()}]">[{oxmultilang ident="HELP"}]</a></div>
        [{/if}]
        [{oxhasrights ident="TOBASKET"}]
            [{block name="footer_services_cart"}]
                <div>
                    <a href="[{oxgetseourl ident=$oViewConf->getBasketLink()}]">
                        [{oxmultilang ident="CART"}]
                    </a>
                    [{if $oxcmp_basket && $oxcmp_basket->getItemsCount() > 0}] ([{$oxcmp_basket->getItemsCount()}])[{/if}]
                </div>
            [{/block}]
        [{/oxhasrights}]
        <div><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account"}]">[{oxmultilang ident="ACCOUNT"}]</a></div>
    [{/block}]

[{/block}]