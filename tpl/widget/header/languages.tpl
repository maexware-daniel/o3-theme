[{if $oView->isLanguageLoaded()}]
    <div class="languages dropdown">
        <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
            [{block name="dd_layout_page_header_icon_menu_languages_button"}]
                [{foreach from=$oxcmp_lang item=_lng}]
                    [{if $_lng->selected}]
                        [{$_lng->name}]
                    [{/if}]
                [{/foreach}]
            [{/block}]
        </button>
        <ul class="dropdown-menu dropdown-menu-dark">
            [{block name="dd_layout_page_header_icon_menu_languages_list"}]
                [{foreach from=$oxcmp_lang item=_lng}]
                    <li>
                        <a class="dropdown-item[{if $_lng->selected}] active[{/if}] [{$_lng->abbr}]" title="[{$_lng->name}]" href="[{$_lng->link|oxaddparams:$oView->getDynUrlParams()}]" hreflang="[{$_lng->abbr}]">
                            [{$_lng->name}]
                        </a>
                    </li>
                [{/foreach}]
            [{/block}]
        </ul>
    </div>
[{/if}]