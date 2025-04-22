[{block name="widget_product_listitem_grid"}]
    [{assign var="product"         value=$oView->getProduct()}]
    [{assign var="blDisableToCart" value=$oView->getDisableToCart()}]
    [{assign var="iIndex"          value=$oView->getIndex()}]
    [{assign var="showMainLink"    value=$oView->getShowMainLink()}]

    [{assign var="currency" value=$oView->getActCurrency()}]
    [{if $showMainLink}]
        [{assign var='_productLink' value=$product->getMainLink()}]
    [{else}]
        [{assign var='_productLink' value=$product->getLink()}]
    [{/if}]
    [{assign var="aVariantSelections" value=$product->getVariantSelections(null,null,1)}]
    [{assign var="blShowToBasket" value=true}] [{* tobasket or more info ? *}]
    [{if $blDisableToCart || $product->isNotBuyable() || ($aVariantSelections&&$aVariantSelections.selections) || $product->hasMdVariants() || ($oViewConf->showSelectListsInList() && $product->getSelections(1)) || $product->getVariants()}]
        [{assign var="blShowToBasket" value=false}]
    [{/if}]

    [{if !$testid }]
        [{assign var=testid value=$oView->getViewParameter('testid')}]
    [{/if}]
    [{if !$listId }]
        [{assign var=listId value=$oView->getViewParameter('listId')}]
    [{/if}]

    <form name="tobasket[{$testid}]" [{if $blShowToBasket}]action="[{$oViewConf->getSelfActionLink()}]" method="post"[{else}]action="[{$_productLink}]" method="get"[{/if}]>
        <div class="d-none">
            [{$oViewConf->getNavFormParams()}]
            [{$oViewConf->getHiddenSid()}]
            <input type="hidden" name="pgNr" value="[{$oView->getActPage()}]">
            [{if $recommid}]
                <input type="hidden" name="recommid" value="[{$recommid}]">
            [{/if}]
            [{if $blShowToBasket}]
            [{oxhasrights ident="TOBASKET"}]
                <input type="hidden" name="cl" value="[{$oViewConf->getTopActiveClassName()}]">
                [{if $owishid}]
                    <input type="hidden" name="owishid" value="[{$owishid}]">
                [{/if}]
                [{if $toBasketFunction}]
                    <input type="hidden" name="fnc" value="[{$toBasketFunction}]">
                [{else}]
                    <input type="hidden" name="fnc" value="tobasket">
                [{/if}]
                <input type="hidden" name="aid" value="[{$product->oxarticles__oxid->value}]">
                [{if $altproduct}]
                    <input type="hidden" name="anid" value="[{$altproduct}]">
                [{else}]
                    <input type="hidden" name="anid" value="[{$product->oxarticles__oxnid->value}]">
                [{/if}]
                <input type="hidden" name="am" value="1">
            [{/oxhasrights}]
            [{else}]
                <input type="hidden" name="cl" value="details">
                <input type="hidden" name="anid" value="[{$product->oxarticles__oxnid->value}]">
            [{/if}]
        </div>

        [{if !$removeFunction}]

            [{if $oxcmp_user}]
                <a class="component__productbox-noticelist" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl="|cat:$oViewConf->getTopActiveClassName() params="aid=`$product->oxarticles__oxnid->value`&anid=`$product->oxarticles__oxnid->value`&amp;fnc=tonoticelist&amp;am=1"|cat:$oViewConf->getNavUrlParams()|cat:"&amp;stoken="|cat:$oViewConf->getSessionChallengeToken()}]">
                    <svg width="21" height="17" viewBox="0 0 21 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M6.61699 1C3.88324 1 1.66699 3.15216 1.66699 5.80685C1.66699 10.6137 7.51699 14.9836 10.667 16C13.817 14.9836 19.667 10.6137 19.667 5.80685C19.667 3.15216 17.4507 1 14.717 1C13.043 1 11.5625 1.80712 10.667 3.04248C10.2105 2.41112 9.60416 1.89586 8.89918 1.54033C8.1942 1.1848 7.41138 0.999456 6.61699 1Z" stroke="#D4D4D4" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>
                </a>
            [{else}]
                <a class="component__productbox-noticelist" title="[{oxmultilang ident="LOGIN_TO_ACCESS_GIFT_REGISTRY"}]" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account" params="anid=`$oDetailsProduct->oxarticles__oxnid->value`"|cat:"&amp;sourcecl="|cat:$oViewConf->getTopActiveClassName()|cat:$oViewConf->getNavUrlParams()}]">
                    <svg width="21" height="17" viewBox="0 0 21 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M6.61699 1C3.88324 1 1.66699 3.15216 1.66699 5.80685C1.66699 10.6137 7.51699 14.9836 10.667 16C13.817 14.9836 19.667 10.6137 19.667 5.80685C19.667 3.15216 17.4507 1 14.717 1C13.043 1 11.5625 1.80712 10.667 3.04248C10.2105 2.41112 9.60416 1.89586 8.89918 1.54033C8.1942 1.1848 7.41138 0.999456 6.61699 1Z" stroke="#D4D4D4" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>
                </a>
            [{/if}]

        [{else}]

            [{if (($owishid && ($owishid==$oxcmp_user->oxuser__oxid->value)) || (($wishid==$oxcmp_user->oxuser__oxid->value)) || $recommid)}]
                <button data-js-noticelist="remove_[{$removeFunction}][{$testid}]" type="submit" class="component__productbox-remove btn" title="[{oxmultilang ident="REMOVE"}]">
                    <svg width="18" height="20" viewBox="0 0 18 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M5.4375 2.3125H5.25C5.35313 2.3125 5.4375 2.22812 5.4375 2.125V2.3125ZM5.4375 2.3125H12.5625V2.125C12.5625 2.22812 12.6469 2.3125 12.75 2.3125H12.5625V4H14.25V2.125C14.25 1.29766 13.5773 0.625 12.75 0.625H5.25C4.42266 0.625 3.75 1.29766 3.75 2.125V4H5.4375V2.3125ZM17.25 4H0.75C0.335156 4 0 4.33516 0 4.75V5.5C0 5.60313 0.084375 5.6875 0.1875 5.6875H1.60312L2.18203 17.9453C2.21953 18.7445 2.88047 19.375 3.67969 19.375H14.3203C15.1219 19.375 15.7805 18.7469 15.818 17.9453L16.3969 5.6875H17.8125C17.9156 5.6875 18 5.60313 18 5.5V4.75C18 4.33516 17.6648 4 17.25 4ZM14.1398 17.6875H3.86016L3.29297 5.6875H14.707L14.1398 17.6875Z" fill="#D4D4D4"/>
                    </svg>
                </button>
            [{/if}]

        [{/if}]

        [{block name="widget_product_listitem_infogrid_gridpicture"}]
            <a class="component__productbox-picture" href="[{$_productLink}]" title="[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]">
                <img loading="lazy" src="[{$product->getThumbnailUrl()}]" alt="[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]">
            </a>
        [{/block}]


        [{block name="widget_product_listitem_infogrid_titlebox"}]
            <a href="[{$_productLink}]" class="component__productbox-title" title="[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]">
                [{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]
            </a>
        [{/block}]

        <div class="component__productbox-price">
            [{block name="widget_product_listitem_grid_price"}]
                [{oxhasrights ident="SHOWARTICLEPRICE"}]
                    [{assign var="oUnitPrice" value=$product->getUnitPrice()}]
                    [{assign var="tprice"     value=$product->getTPrice()}]
                    [{assign var="price"      value=$product->getPrice()}]

                    [{if $tprice && $tprice->getBruttoPrice() > $price->getBruttoPrice()}]
                        <del class="component__productbox-price-old">[{$product->getFTPrice()}] [{$currency->sign}]</del>
                    [{/if}]

                    [{block name="widget_product_listitem_grid_price_value"}]
                        [{if $product->getFPrice()}]
                            <span class="lead">
                                [{if $product->isRangePrice()}]
                                    [{oxmultilang ident="PRICE_FROM"}]
                                    [{if !$product->isParentNotBuyable()}]
                                        [{$product->getFMinPrice()}]
                                    [{else}]
                                        [{$product->getFVarMinPrice()}]
                                    [{/if}]
                                [{else}]
                                    [{if !$product->isParentNotBuyable()}]
                                        [{$product->getFPrice()}]
                                    [{else}]
                                        [{$product->getFVarMinPrice()}]
                                    [{/if}]
                                [{/if}]
                                [{$currency->sign}]
                                [{if $oView->isVatIncluded()}]
                                     [{if !($product->hasMdVariants() || ($oViewConf->showSelectListsInList() && $product->getSelections(1)) || $product->getVariants())}]*[{/if}]
                                [{/if}]
                            </span>
                        [{/if}]
                    [{/block}]

                    [{if $oUnitPrice}]
                        <span id="productPricePerUnit_[{$testid}]" class="pricePerUnit">
                            [{$product->oxarticles__oxunitquantity->value}] [{$product->getUnitName()}] | [{oxprice price=$oUnitPrice currency=$currency}]/[{$product->getUnitName()}]
                        </span>
                    [{elseif $product->oxarticles__oxweight->value }]
                        <span id="productPricePerUnit_[{$testid}]" class="pricePerUnit">
                            <span title="weight">[{oxmultilang ident="WEIGHT"}]</span>
                            <span class="value">[{$product->oxarticles__oxweight->value}] [{oxmultilang ident="KG"}]</span>
                        </span>
                    [{/if}]
                [{/oxhasrights}]
            [{/block}]
        </div>

        [{block name="widget_product_listitem_grid_tobasket"}][{/block}]

    </form>

    [{if $removeFunction && (($owishid && ($owishid==$oxcmp_user->oxuser__oxid->value)) || (($wishid==$oxcmp_user->oxuser__oxid->value)) || $recommid)}]
        <form action="[{$oViewConf->getSelfActionLink()}]" method="post" id="remove_[{$removeFunction}][{$testid}]" class="d-none">
            <div>
                [{$oViewConf->getHiddenSid()}]
                <input type="hidden" name="cl" value="[{$oViewConf->getTopActiveClassName()}]">
                <input type="hidden" name="fnc" value="[{$removeFunction}]">
                <input type="hidden" name="aid" value="[{$product->oxarticles__oxid->value}]">
                <input type="hidden" name="am" value="0">
                <input type="hidden" name="itmid" value="[{$product->getItemKey()}]">
                [{if $recommid}]
                    <input type="hidden" name="recommid" value="[{$recommid}]">
                [{/if}]
            </div>
        </form>
    [{/if}]
[{/block}]