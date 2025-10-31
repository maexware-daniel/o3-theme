[{assign var="blFirstTab" value=true}]

[{block name="details_tabs_longdescription"}]
    [{oxhasrights ident="SHOWLONGDESCRIPTION"}]
        [{assign var="oLongdesc" value=$oDetailsProduct->getLongDescription()}]
        [{if $oLongdesc->value}]
            [{capture append="tabs"}]<a class="nav-link[{if $blFirstTab}] active[{/if}]" href="#details__description" role="tab" data-bs-toggle="tab" aria-controls="details__description" aria-selected="[{if $blFirstTab}]true[{else}]false[{/if}]">[{oxmultilang ident="DESCRIPTION"}]</a>[{/capture}]
            [{capture append="tabsContent"}]
                <div id="details__description" class="details__description tab-pane[{if $blFirstTab}] active[{/if}]" role="tabpanel">
                    <h4 class="d-md-none">[{oxmultilang ident="DESCRIPTION"}]</h4>
                    <span itemprop="description">[{oxeval var=$oLongdesc}]</span>
                    [{if $oDetailsProduct->oxarticles__oxexturl->value}]
                        <a class="mt-5" href="[{$oDetailsProduct->oxarticles__oxexturl->value}]">
                            [{if $oDetailsProduct->oxarticles__oxurldesc->value}]
                                [{$oDetailsProduct->oxarticles__oxurldesc->value}]
                            [{else}]
                                [{$oDetailsProduct->oxarticles__oxexturl->value}]
                            [{/if}]
                        </a>
                    [{/if}]
                </div>
            [{/capture}]
            [{assign var="blFirstTab" value=false}]
        [{/if}]
    [{/oxhasrights}]
[{/block}]

[{block name="details_tabs_attributes"}]
    [{if $oView->getAttributes()}]
        [{capture append="tabs"}]<a class="nav-link[{if $blFirstTab}] active[{/if}]" href="#details__attributes" role="tab" data-bs-toggle="tab" aria-controls="details__attributes" aria-selected="[{if $blFirstTab}]true[{else}]false[{/if}]">[{oxmultilang ident="SPECIFICATION"}]</a>[{/capture}]
        [{capture append="tabsContent"}]
            <div id="details__attributes" class="details__attributes tab-pane col-12 col-lg-8[{if $blFirstTab}] active[{/if}]" role="tabpanel">
                <h4 class="d-md-none">[{oxmultilang ident="SPECIFICATION"}]</h4>
                [{include file="page/details/inc/attributes.tpl"}]
            </div>
            [{assign var="blFirstTab" value=false}]
        [{/capture}]
    [{/if}]
[{/block}]

[{block name="details_tabs_reviews"}]
    [{if $oView->isReviewActive()}]

        [{if $oxcmp_shop->oxshops__oxproductive->value}]
            [{oxscript include="js/widget/rating.min.js" priority=10}]
        [{else}]
            [{oxscript include="js/widget/rating.js" priority=10}]
        [{/if}]

        [{capture append="tabs"}]<a class="nav-link[{if $blFirstTab}] active[{/if}]" href="#details__reviews" role="tab" data-bs-toggle="tab" aria-controls="details__reviews" aria-selected="[{if $blFirstTab}]true[{else}]false[{/if}]">[{oxmultilang ident="REVIEWS"}] ([{if $oView->getReviews()}][{$oView->getReviews()|count}][{else}]0[{/if}])</a>[{/capture}]
        [{capture append="tabsContent"}]
            <div id="details__reviews" class="details__reviews tab-pane col-12 col-lg-8[{if $blFirstTab}] active[{/if}]" role="tabpanel">
                <h4 class="d-md-none">[{oxmultilang ident="REVIEWS"}] ([{if $oView->getReviews()}][{$oView->getReviews()|count}][{else}]0[{/if}])</h4>
                [{include file="widget/reviews/reviews.tpl"}]
            </div>
            [{assign var="blFirstTab" value=false}]
        [{/capture}]
    [{/if}]
[{/block}]

[{block name="details_tabs_tags"}]
[{/block}]

[{block name="details_tabs_media"}]
    [{if $oView->getMediaFiles() || $oDetailsProduct->oxarticles__oxfile->value}]
        [{capture append="tabs"}]<a class="nav-link[{if $blFirstTab}] active[{/if}]" href="#details__media" role="tab" data-bs-toggle="tab" aria-controls="details__media" aria-selected="[{if $blFirstTab}]true[{else}]false[{/if}]">[{oxmultilang ident="MEDIA"}]</a>[{/capture}]
        [{capture append="tabsContent"}]
            <div id="details__media" class="details__media tab-pane col-12 col-lg-8[{if $blFirstTab}] active[{/if}]" role="tabpanel">
                <h4 class="d-md-none">[{oxmultilang ident="MEDIA"}]</h4>
                [{include file="page/details/inc/media.tpl"}]
            </div>
            [{assign var="blFirstTab" value=false}]
        [{/capture}]
    [{/if}]
[{/block}]

[{if $oViewConf->getViewThemeParam('bl_showPriceAlarm')}]
    [{block name="details_tabs_pricealarm"}]
        [{if $oView->isPriceAlarm() && !$oDetailsProduct->isParentNotBuyable()}]
            [{capture append="tabs"}]<a class="nav-link[{if $blFirstTab}] active[{/if}]" href="#details__pricealarm" role="tab" data-bs-toggle="tab" aria-controls="details__pricealarm" aria-selected="[{if $blFirstTab}]true[{else}]false[{/if}]">[{oxmultilang ident="DD_PRICEALARM_HEADING"}]</a>[{/capture}]
            [{capture append="tabsContent"}]
                <div id="details__pricealarm" class="details__pricealarm tab-pane col-12 col-lg-8[{if $blFirstTab}] active[{/if}]" role="tabpanel">
                    <h4 class="d-md-none">[{oxmultilang ident="DD_PRICEALARM_HEADING"}]</h4>
                    [{include file="form/pricealarm.tpl"}]
                </div>
                [{assign var="blFirstTab" value=false}]
            [{/capture}]
        [{/if}]
    [{/block}]
[{/if}]

[{block name="details_tabs_comments"}]
[{/block}]

[{block name="details_tabs_invite"}]
[{/block}]

[{block name="details_tabs_main"}]
    [{if $tabs}]        
        <ul class="nav nav-tabs col-12 col-xl-8 d-none d-md-flex" role="tablist">
            [{foreach from=$tabs item="tab" name="tabs"}]
                <li class="nav-item" role="presentation">[{$tab}]</li>
            [{/foreach}]
            [{block name="details_tabs_social_navigation"}][{/block}]
        </ul>
        <div class="tab-content">
            [{foreach from=$tabsContent item="tabContent" name="tabsContent"}]
                [{$tabContent}]
            [{/foreach}]
            [{block name="details_tabs_social_content"}][{/block}]
        </div>        
    [{/if}]
[{/block}]

