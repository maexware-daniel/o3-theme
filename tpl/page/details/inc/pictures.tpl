<div class="details__picture">

    <div class="details__picture-main[{if $oView->morePics()}] splide[{/if}]"
         [{if $oView->morePics()}]data-splide='{
                                "mediaQuery": "min",
                                "pagination" : false,
                                "rewind": true,
                                "arrows" : false,
                                "breakpoints":{
                                    "992":{
                                        "arrows": true
                                    }
                                }
                                }'
         [{/if}]
    >
        [{if $oView->morePics()}]
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
                    [{foreach from=$oView->getIcons() key="iPicNr" item="oArtIcon" name="sMorePics"}]
                        <div class="splide__slide[{if $iPicNr == 1}] active[{/if}]">
                            <img src="[{$oPictureProduct->getPictureUrl($iPicNr)}]" alt="[{$oPictureProduct->oxarticles__oxtitle->value|strip_tags}] [{$oPictureProduct->oxarticles__oxvarselect->value|strip_tags}]" itemprop="image" class="splide__img">
                        </div>
                    [{/foreach}]
                </div>
            </div>
        [{else}]
            <img src="[{$oPictureProduct->getPictureUrl(1)}]" alt="[{$oPictureProduct->oxarticles__oxtitle->value|strip_tags}] [{$oPictureProduct->oxarticles__oxvarselect->value|strip_tags}]" itemprop="image">
        [{/if}]
    </div>

    [{if $oView->morePics()}]
        <div class="details__picture-thumbnails splide" data-splide='{
                                 "mediaQuery": "min",
                                 "rewind": true,
                                 "isNavigation": true,
                                 "pagination": false,
                                 "breakpoints":{
                                    "1200":{
                                        "fixedWidth": 114,
                                        "fixedHeight": 114,
                                        "gap": 15
                                    },
                                    "992":{
                                        "arrows": false,
                                        "gap": 12
                                    },
                                    "0":{
                                        "fixedWidth": 66,
                                        "fixedHeight": 66,
                                        "gap": 5
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
                    [{foreach from=$oView->getIcons() key="iPicNr" item="oArtIcon" name="sMorePics"}]
                        [{math equation="a-b" a=$iPicNr b=1 assign="startFromNull"}]
                        <img class="splide__slide" [{if $smarty.foreach.sMorePics.first}][{/if}] src="[{$oPictureProduct->getIconUrl($iPicNr)}]" alt="[{$smarty.foreach.sMorePics.iteration}]">
                    [{/foreach}]
                </div>
            </div>
        </div>

        [{oxscript add="
            function initPictureSlider() {
                let main = new Splide('.details__picture-main');
                let thumbnails = new Splide('.details__picture-thumbnails');

                main.sync( thumbnails );
                main.mount();
                thumbnails.mount();
            }
            initPictureSlider();
        "}]

    [{/if}]
</div>