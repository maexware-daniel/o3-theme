[{block name="widget_locator_sort"}]
    [{if $oView->showSorting()}]
        [{assign var="_listType" value=$oView->getListDisplayType()}]
        [{assign var="_additionalParams" value=$oView->getAdditionalParams()}]
        [{assign var="_artPerPage" value=$oViewConf->getArtPerPageCount()}]
        [{assign var="_sortColumnVarName" value=$oView->getSortOrderByParameterName()}]
        [{assign var="_sortDirectionVarName" value=$oView->getSortOrderParameterName()}]

        <div class="alist__orga-sort dropdown">
            <button type="button" class="btn dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                [{if $oView->getListOrderBy()}]
                    [{oxmultilang ident=$oView->getListOrderBy()|upper }]
                [{else}]
                    [{oxmultilang ident="SORT_BY"}]
                [{/if}]
            </button>
            <ul class="dropdown-menu" >
                [{foreach from=$oView->getSortColumns() item=sColumnName}]
                    <li class="desc[{if $oView->getListOrderDirection() == 'desc' && $sColumnName == $oView->getListOrderBy()}] active[{/if}]">
                        <a class="dropdown-item" href="[{$oView->getLink()|oxaddparams:"ldtype=$_listType&amp;_artperpage=$_artPerPage&amp;$_sortColumnVarName=$sColumnName&amp;$_sortDirectionVarName=desc&amp;pgNr=0&amp;$_additionalParams"}]">
                            [{oxmultilang ident=$sColumnName|upper}] [{oxmultilang ident="DD_SORT_DESC"}]
                        </a>
                    </li>
                    <li class="asc[{if $oView->getListOrderDirection() == 'asc' && $sColumnName == $oView->getListOrderBy()}] active[{/if}]">
                        <a class="dropdown-item" href="[{$oView->getLink()|oxaddparams:"ldtype=$_listType&amp;_artperpage=$_artPerPage&amp;$_sortColumnVarName=$sColumnName&amp;$_sortDirectionVarName=asc&amp;pgNr=0&amp;$_additionalParams"}]">
                            [{oxmultilang ident=$sColumnName|upper}] [{oxmultilang ident="DD_SORT_ASC"}]
                        </a>
                    </li>
                [{/foreach}]
            </ul>
        </div>
    [{/if}]
[{/block}]