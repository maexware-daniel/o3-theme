<div class="start__fixedbanner splide" data-splide='{
                                "mediaQuery": "min",
                                "breakpoints":{
                                    "1400":{
                                        "destroy": true
                                    },
                                    "454":{
                                        "fixedWidth": "420px",
                                        "gap": "15px"
                                    },
                                    "0":{
                                        "arrows": false
                                    }
                                }
                                }'
>
    <div class="splide__track">
        <div class="splide__list">
            [{if $fixedBanner.fixedBannerSmall1}]
                [{if $fixedBanner.fixedBannerSmall1->getBannerLink()}]
                    <a class="splide__slide" href="[{$fixedBanner.fixedBannerSmall1->getBannerLink()}]">
                        <img class="img-fluid" src="[{$fixedBanner.fixedBannerSmall1->getBannerPictureUrl()}]" alt="[{$fixedBanner.fixedBannerSmall1->oxactions__oxtitle->value}]">
                    </a>
                [{else}]
                    <img class="splide__slide img-fluid" src="[{$fixedBanner.fixedBannerSmall1->getBannerPictureUrl()}]" alt="[{$fixedBanner.fixedBannerSmall1->oxactions__oxtitle->value}]">
                [{/if}]
            [{/if}]

            [{if $fixedBanner.fixedBannerSmall2}]
                [{if $fixedBanner.fixedBannerSmall2->getBannerLink()}]
                    <a class="splide__slide" href="[{$fixedBanner.fixedBannerSmall2->getBannerLink()}]">
                        <img class="img-fluid" src="[{$fixedBanner.fixedBannerSmall2->getBannerPictureUrl()}]" alt="[{$fixedBanner.fixedBannerSmall2->oxactions__oxtitle->value}]">
                    </a>
                [{else}]
                    <img class="splide__slide img-fluid" src="[{$fixedBanner.fixedBannerSmall2->getBannerPictureUrl()}]" alt="[{$fixedBanner.fixedBannerSmall2->oxactions__oxtitle->value}]">
                [{/if}]
            [{/if}]

            [{if $fixedBanner.fixedBannerSmall3}]
                [{if $fixedBanner.fixedBannerSmall3->getBannerLink()}]
                    <a class="splide__slide" href="[{$fixedBanner.fixedBannerSmall3->getBannerLink()}]">
                        <img class="img-fluid" src="[{$fixedBanner.fixedBannerSmall3->getBannerPictureUrl()}]" alt="[{$fixedBanner.fixedBannerSmall3->oxactions__oxtitle->value}]">
                    </a>
                [{else}]
                    <img class="splide__slide img-fluid" src="[{$fixedBanner.fixedBannerSmall3->getBannerPictureUrl()}]" alt="[{$fixedBanner.fixedBannerSmall3->oxactions__oxtitle->value}]">
                [{/if}]
            [{/if}]
        </div>
    </div>
</div>

[{oxscript add="new Splide('.start__fixedbanner').mount();"}]