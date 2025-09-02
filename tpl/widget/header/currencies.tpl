[{if $oView->loadCurrency()}]
    [{assign var="currency" value=$oView->getActCurrency()}]
    <div class="currencies dropdown">
        <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
            [{block name="dd_layout_page_header_icon_menu_currencies_button"}]
                [{$currency->name}]
            [{/block}]
        </button>
        <ul class="dropdown-menu dropdown-menu-dark">
            [{block name="dd_layout_page_header_icon_menu_currencies_list"}]
                [{foreach from=$oxcmp_cur item=_cur}]
                    <li>
                        <a class="dropdown-item[{if $_cur->selected}] active[{/if}]" href="[{$_cur->link|oxaddparams:$oView->getDynUrlParams()}]" title="[{$_cur->name}]">[{$_cur->name}]</a>
                    </li>
                [{/foreach}]
            [{/block}]
        </ul>
    </div>
[{/if}]