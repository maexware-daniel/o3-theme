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

    [{block name="widget_product_list_head"}]
        [{if $rsslink}]
            <a class="rss" id="[{$rssId}]" aria-label="RSS" href="[{$rsslink.link}]" target="_blank">
                <i class="fas fa-rss"></i>
            </a>
        [{/if}]
    [{/block}]

    [{if $products && !empty($products)}]

        <div class="row[{if $listId == "productList" && $oView->getAttributes()}] col-12 col-md-9[{else}] col-12[{/if}] [{$type}]-view" data-listing="[{$listId}]">
            [{foreach from=$products item="_product" name="productlist"}]

                [{assign var="testid" value=$listId|cat:"_"|cat:$smarty.foreach.productlist.iteration}]
                [{block name="widget_product_list_item"}]
                    <div class="component__productbox col-12[{if $type != 'line'}] col-sm-6 [{if $listId == "productList" && $oView->getAttributes()}]col-md-4[{else}]col-md-3[{/if}][{/if}]">
                        [{oxid_include_widget cl="oxwArticleBox" _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() iLinkType=$_product->getLinkType() _object=$_product anid=$_product->getId() sWidgetType=product sListType=listitem_$type iIndex=$testid blDisableToCart=$blDisableToCart isVatIncluded=$oView->isVatIncluded() showMainLink=$showMainLink recommid=$recommid owishid=$owishid toBasketFunction=$toBasketFunction removeFunction=$removeFunction altproduct=$altproduct inlist=$_product->isInList() skipESIforUser=1 testid=$testid}]
                    </div>
                [{/block}]

            [{/foreach}]
        </div>
    [{/if}]

[{/block}]