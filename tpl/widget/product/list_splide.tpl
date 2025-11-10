[{if !$type}]
    [{assign var="type" value="grid"}]
[{/if}]

[{if !$testid }]
    [{assign var=testid value=$oView->getViewParameter('testid')}]
[{/if}]
[{if !$listId }]
    [{assign var=listId value=$oView->getViewParameter('listId')}]
[{/if}]

[{block name="widget_product_list"}]

    [{block name="widget_product_list_head"}][{/block}]

    [{if $products && !empty($products)}]

        <div class="component__productslider-[{$listId}] splide" data-list-id="[{$listId}]" data-splide='{
                                "mediaQuery": "min",
                                "perMove":1,
                                "breakpoints":{
                                    "1400":{
                                        "perPage":5,
                                        "pagination": false,
                                        "arrows": true
                                    },
                                    "992":{
                                        "perPage":4
                                    },
                                    "768":{
                                        "perPage":3
                                    },
                                    "0":{
                                        "perPage":2,
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
                    [{foreach from=$products item="_product" name="productlist"}]

                        [{assign var="testid" value=$listId|cat:"_"|cat:$smarty.foreach.productlist.iteration}]
                        [{block name="widget_product_list_item"}]
                            <div class="component__productbox splide__slide">
                                [{oxid_include_widget cl="oxwArticleBox" _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() iLinkType=$_product->getLinkType() _object=$_product anid=$_product->getId() sWidgetType=product sListType=listitem_$type iIndex=$testid blDisableToCart=$blDisableToCart isVatIncluded=$oView->isVatIncluded() showMainLink=$showMainLink recommid=$recommid owishid=$owishid toBasketFunction=$toBasketFunction removeFunction=$removeFunction altproduct=$altproduct inlist=$_product->isInList() skipESIforUser=1 testid=$testid}]
                            </div>
                        [{/block}]

                    [{/foreach}]
                </div>
            </div>
            <div class="splide__progress">
                <div class="splide__progress-bar"></div>
            </div>
        </div>

    [{/if}]

[{/block}]