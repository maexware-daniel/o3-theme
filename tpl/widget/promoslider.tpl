[{block name="dd_widget_promoslider"}]
    [{assign var="oBanners" value=$oView->getBanners()}]
    [{assign var="currency" value=$oView->getActCurrency()}]

    [{if $oBanners|@count}]

        <div class="start__promoslider splide" data-splide='{
                                "mediaQuery": "min",
                                [{if $oViewConf->getViewThemeParam('sSliderAutostart') == "on"}]
                                    "autoplay": true,
                                    "interval": [{$oViewConf->getViewThemeParam('sSliderInterval')}],
                                    "speed": [{$oViewConf->getViewThemeParam('sSliderSpeed')}],
                                [{/if}]
                                [{if $oViewConf->getViewThemeParam('sSliderSlideFade') == "fade"}]
                                    "type": "fade",
                                [{/if}]
                                "breakpoints":{
                                    "1400":{
                                        "pagination": false,
                                        "arrows": true
                                    },
                                    "0":{
                                        "arrows": false
                                    }
                                }
                                }'
        >
            <div class="splide__arrows">
                <button type="button" class="splide__arrow splide__arrow--prev">
                    <svg width="6" height="10" viewBox="0 0 6 10" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M5 1L1 5L5 9" stroke="#121212" stroke-width="1.4" stroke-linecap="square" stroke-linejoin="round"/>
                    </svg>
                </button>
                <button type="button" class="splide__arrow splide__arrow--next">
                    <svg width="6" height="10" viewBox="0 0 6 10" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M1 1L5 5L1 9" stroke="#121212" stroke-width="1.4" stroke-linecap="square" stroke-linejoin="round"/>
                    </svg>
                </button>
            </div>
            <div class="splide__track">
                <div class="splide__list">
                    [{block name="dd_widget_promoslider_list"}]
                        [{foreach from=$oBanners key="iPicNr" item="oBanner" name="promoslider"}]
                            [{assign var="oArticle" value=$oBanner->getBannerArticle()}]
                            [{assign var="sBannerPictureUrl" value=$oBanner->getBannerPictureUrl()}]
                            [{if $sBannerPictureUrl && !$oBanner->oxactions__oxid->value|strstr:"fixedBanner"}]
                                [{assign var="sBannerLink" value=$oBanner->getBannerLink()}]
                                [{if $sBannerLink}]
                                    <a class="splide__slide" href="[{$sBannerLink}]" title="[{$oBanner->oxactions__oxtitle->value}]">
                                        <img src="[{$sBannerPictureUrl}]" class="d-block w-100" alt="[{$oBanner->oxactions__oxtitle->value}]" title="[{$oBanner->oxactions__oxtitle->value}]">
                                    </a>
                                [{else}]
                                    <img src="[{$sBannerPictureUrl}]" class="splide__slide d-block w-100" alt="[{$oBanner->oxactions__oxtitle->value}]" title="[{$oBanner->oxactions__oxtitle->value}]">
                                [{/if}]
                            [{/if}]
                        [{/foreach}]
                    [{/block}]
                </div>
            </div>
        </div>

        [{oxscript add="new Splide('.start__promoslider').mount();"}]

    [{/if}]
[{/block}]
