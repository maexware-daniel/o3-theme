[{capture append="oxidBlock_content"}]

    [{block name="checkout_basket_main"}]
        [{assign var="currency" value=$oView->getActCurrency()}]

        <h1 class="title-big">
            [{oxmultilang ident="CART"}]
            <span>
                [{if $oxcmp_basket->getProductsCount()}]
                    [{$oxcmp_basket->getProductsCount()}] [{oxmultilang ident="O3_ARTICLE"}]
                [{/if}]
            </span>
        </h1>

        <hr class="hr-big">

        [{if $oView->isLowOrderPrice()}]
            [{block name="checkout_basket_loworderprice_top"}]
                <div class="alert alert-info">[{oxmultilang ident="MIN_ORDER_PRICE"}] [{$oView->getMinOrderPrice()}] [{$currency->sign}]</div>
            [{/block}]
        [{/if}]

        [{if !$oxcmp_basket->getProductsCount()}]

            [{block name="checkout_basket_emptyshippingcart"}]
                <div class="alert alert-danger" id="empty-basket-warning">
                    <a href="[{$oViewConf->getHomeLink()}]" title="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]" class="btn btn-outline-dark"><i class="fa fa-caret-left"></i> [{oxmultilang ident="DD_BASKET_BACK_TO_SHOP"}]</a>
                    [{oxmultilang ident="BASKET_EMPTY"}]
                </div>
            [{/block}]

        [{else}]

            [{block name="checkout_basket_next_step_top"}]
                [{block name="checkout_basket_backtoshop_top"}]
                [{/block}]
                [{block name="basket_btn_next_top"}]
                [{/block}]
            [{/block}]

            <div class="basket">
                [{include file="page/checkout/inc/basketcontents.tpl" editable=true}]

                [{block name="checkout_basket_next_step_bottom"}]

                    [{block name="checkout_basket_loworderprice_bottom"}]
                    [{/block}]
                    [{block name="checkout_basket_backtoshop_bottom"}]
                    [{/block}]

                    [{if !$oView->isLowOrderPrice()}]
                        [{block name="basket_btn_next_bottom"}]
                            <form action="[{$oViewConf->getSslSelfLink()}]" method="post" class="basket__proceed">
                                <div class="d-none">
                                    [{$oViewConf->getHiddenSid()}]
                                    <input type="hidden" name="cl" value="user">
                                </div>
                                <button type="submit" class="btn btn-primary">
                                    [{oxmultilang ident="CONTINUE_TO_NEXT_STEP"}]
                                </button>
                            </form>
                        [{/block}]
                    [{/if}]
                [{/block}]
            </div>
        [{/if}]

        [{if $oView->isWrapping()}]
           [{include file="page/checkout/inc/wrapping.tpl"}]
        [{/if}]

    [{/block}]

    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]

[{include file="layout/page.tpl" blHideBreadcrumb=true}]
