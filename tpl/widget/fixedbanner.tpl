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
            [{if $fixedBanner.fixedBanner1}]
                [{if $fixedBanner.fixedBanner1->getBannerLink()}]
                    <a class="splide__slide" href="[{$fixedBanner.fixedBanner1->getBannerLink()}]">
                        <img class="img-fluid" src="[{$fixedBanner.fixedBanner1->getBannerPictureUrl()}]" alt="[{$fixedBanner.fixedBanner1->oxactions__oxtitle->value}]">
                    </a>
                [{else}]
                    <img class="splide__slide img-fluid" src="[{$fixedBanner.fixedBanner1->getBannerPictureUrl()}]" alt="[{$fixedBanner.fixedBanner1->oxactions__oxtitle->value}]">
                [{/if}]
            [{/if}]

            [{if $fixedBanner.fixedBanner2}]
                [{if $fixedBanner.fixedBanner2->getBannerLink()}]
                    <a class="splide__slide" href="[{$fixedBanner.fixedBanner2->getBannerLink()}]">
                        <img class="img-fluid" src="[{$fixedBanner.fixedBanner2->getBannerPictureUrl()}]" alt="[{$fixedBanner.fixedBanner2->oxactions__oxtitle->value}]">
                    </a>
                [{else}]
                    <img class="splide__slide img-fluid" src="[{$fixedBanner.fixedBanner2->getBannerPictureUrl()}]" alt="[{$fixedBanner.fixedBanner2->oxactions__oxtitle->value}]">
                [{/if}]
            [{/if}]

            [{if $fixedBanner.fixedBanner3}]
                [{if $fixedBanner.fixedBanner3->getBannerLink()}]
                    <a class="splide__slide" href="[{$fixedBanner.fixedBanner3->getBannerLink()}]">
                        <img class="img-fluid" src="[{$fixedBanner.fixedBanner3->getBannerPictureUrl()}]" alt="[{$fixedBanner.fixedBanner3->oxactions__oxtitle->value}]">
                    </a>
                [{else}]
                    <img class="splide__slide img-fluid" src="[{$fixedBanner.fixedBanner3->getBannerPictureUrl()}]" alt="[{$fixedBanner.fixedBanner3->oxactions__oxtitle->value}]">
                [{/if}]
            [{/if}]
        </div>
    </div>
</div>

[{oxscript add="new Splide('.start__fixedbanner').mount();"}]