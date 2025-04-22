[{if $oView->loadCurrency()}]
    [{assign var="currency" value=$oView->getActCurrency()}]
    <div class="currencies dropdown">
        <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
            [{block name="dd_layout_page_header_icon_menu_currencies_button"}]
                [{$currency->name}]
            [{/block}]
        </button>
        <ul class="dropdown-menu">
            [{block name="dd_layout_page_header_icon_menu_currencies_list"}]
                [{foreach from=$oxcmp_cur item=_cur}]
                    [{if $_cur->selected}]
                        [{assign var="selectedCurrency" value=$_cur->name}]
                        [{capture name="currencySelected"}]
                            <li>
                                <a class="dropdown-item" href="[{$_cur->link|oxaddparams:$oView->getDynUrlParams()}]" title="[{$_cur->name}]">
                                    <span>[{$_cur->name}]</span>
                                </a>
                            </li>
                        [{/capture}]
                    [{/if}]
                    <li[{if $_cur->selected}] class="active"[{/if}]>
                        <a class="dropdown-item" href="[{$_cur->link|oxaddparams:$oView->getDynUrlParams()}]" title="[{$_cur->name}]">[{$_cur->name}]</a>
                    </li>
                [{/foreach}]
            [{/block}]
        </ul>
    </div>
[{/if}]