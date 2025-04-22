[{block name="widget_locator_attributes"}]
    [{if $attributes}]
        [{assign var="allActiveValue" value=$sActiveValue}]

        <form method="get" action="[{$oViewConf->getSelfActionLink()}]" name="_filterlist" class="alist__filter-form" data-js="alist__filter">
            <div class="d-none">
                [{$oViewConf->getHiddenSid()}]
                [{$oViewConf->getNavFormParams()}]
                <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
                <input type="hidden" name="tpl" value="[{$oViewConf->getActTplName()}]">
                <input type="hidden" name="oxloadid" value="[{$oViewConf->getActContentLoadId()}]">
                <input type="hidden" name="fnc" value="executefilter">
                <input type="hidden" name="fname" value="">
            </div>

            [{foreach from=$attributes item=oFilterAttr key=sAttrID name=attr}]
                [{assign var="sActiveValue" value=$oFilterAttr->getActiveValue()}]

                <button type="button" class="btn" data-bs-toggle="collapse" data-bs-target="#filter[{$sAttrID}]" aria-controls="filter[{$sAttrID}]" aria-expanded="[{if $oViewConf->getViewThemeParam('blShowFilters')}]true[{else}]false[{/if}]">
                    [{$oFilterAttr->getTitle()}]
                </button>

                <div class="collapse[{if $oViewConf->getViewThemeParam('blShowFilters')}] show[{/if}]" id="filter[{$sAttrID}]">
                    <input type="hidden" name="attrfilter[[{$sAttrID}]]" value="[{$sActiveValue}]">
                    [{foreach from=$oFilterAttr->getValues() item=sValue name=filterValues}]
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="[{$sValue}]" id="[{$sAttrID}]i[{$smarty.foreach.filterValues.index}][{if $offcanvas}]offcanvas[{/if}]"[{if $sActiveValue == $sValue}] checked[{/if}]>
                            <label class="form-check-label" for="[{$sAttrID}]i[{$smarty.foreach.filterValues.index}][{if $offcanvas}]offcanvas[{/if}]">
                                [{$sValue}]
                            </label>
                        </div>

                        [{if $sActiveValue}]
                            [{capture append="activeValuesClose"}]
                                <button type="button" data-delete="attrfilter[[{$sAttrID}]]" class="btn">
                                    [{$sValue}]
                                    <svg width="10" height="11" viewBox="0 0 10 11" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M1.5 2L8.5 9M1.5 9L8.5 2" stroke="#929292" stroke-width="1.5" stroke-linecap="square"/>
                                    </svg>
                                </button>
                            [{/capture}]
                        [{/if}]
                    [{/foreach}]
                </div>

                [{if $sActiveValue}]
                    [{assign var="hasActiveValue" value=$sActiveValue}]
                    [{assign var="allActiveValues" value=$allActiveValues|cat:$sActiveValue|cat:','}]
                [{/if}]
            [{/foreach}]

            <div class="alist__filter-active">
                [{foreach from=$activeValuesClose item="activeValueClose"}]
                    [{$activeValueClose}]
                [{/foreach}]
            </div>
            <button data-js="alist__filter-apply" type="submit" class="alist__filter-apply btn btn-primary btn-lg d-md-none">[{oxmultilang ident="APPLY"}]</button>
        </form>

        [{if $hasActiveValue}]
            <form method="get" action="[{$oViewConf->getSelfActionLink()}]" name="_resetFilter" id="resetFilter" class="order-first">
                [{$oViewConf->getHiddenSid()}]
                [{$oViewConf->getNavFormParams()}]
                <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
                <input type="hidden" name="fnc" value="resetFilter">

                <div class="title-small">[{oxmultilang ident="DD_LISTLOCATOR_FILTER_ATTRIBUTES"}]<span><button type="submit" class="btn">[{oxmultilang ident="DD_CATEGORY_RESET_BUTTON"}]</button></span></div>
            </form>
        [{else}]
            <div class="title-small order-first">[{oxmultilang ident="DD_LISTLOCATOR_FILTER_ATTRIBUTES"}]</div>
        [{/if}]
    [{/if}]
[{/block}]