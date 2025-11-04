[{* basket contents *}]

[{if $oxcmp_shop->oxshops__oxproductive->value}]
    [{oxscript include="js/widget/validate.min.js" priority=10}]
[{else}]
    [{oxscript include="js/widget/validate.js" priority=10}]
[{/if}]

[{assign var="currency" value=$oView->getActCurrency()}]

<form name="basket[{$basketindex}]" action="[{$oViewConf->getSelfActionLink()}]" method="post" class="basket__articles" data-js="tobasket-change">
    [{$oViewConf->getHiddenSid()}]
    <input type="hidden" name="cl" value="basket">
    <input type="hidden" name="fnc" value="changebasket">
    <input type="hidden" name="CustomError" value="basket">

    [{block name="checkout_basketcontents_list"}]
        [{include file="page/checkout/inc/basketcontents_list.tpl"}]
    [{/block}]
</form>

[{block name="checkout_basketcontents_summary"}]
    <div class="basket__summary">

        <div class="basket__summary-title">[{oxmultilang ident="O3_ORDER_SUMMARY"}]</div>

        [{*  basket summary  *}]
        <table class="table table-borderless">
            [{block name="checkout_basketcontents_summary_table_inner"}]
                [{if !$oxcmp_basket->getDiscounts()}]
                    [{block name="checkout_basketcontents_nodiscounttotalnet"}]
                        <tr>
                            <th>[{oxmultilang ident="TOTAL_NET"}]</th>
                            <td id="basketTotalProductsNetto" class="text-end">[{oxprice price=$oxcmp_basket->getNettoSum() currency=$currency}]</td>
                        </tr>
                    [{/block}]

                    [{block name="checkout_basketcontents_nodiscountproductvats"}]
                        [{foreach from=$oxcmp_basket->getProductVats(false) item=VATitem key=key}]
                            <tr>
                                <th>[{oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$key}]</th>
                                <td class="text-end">[{oxprice price=$VATitem currency=$currency}]</td>
                            </tr>
                        [{/foreach}]
                    [{/block}]

                    [{block name="checkout_basketcontents_nodiscounttotalgross"}]
                        <tr>
                            <th>[{oxmultilang ident="TOTAL_GROSS" suffix="COLON"}]</th>
                            <td id="basketTotalProductsGross" class="text-end">[{oxprice price=$oxcmp_basket->getBruttoSum() currency=$currency}]</td>
                        </tr>
                    [{/block}]
                [{else}]
                    [{if $oxcmp_basket->isPriceViewModeNetto()}]
                        [{block name="checkout_basketcontents_discounttotalnet"}]
                            <tr>
                                <th>[{oxmultilang ident="TOTAL_NET"}]</th>
                                <td id="basketTotalProductsNetto" class="text-end">[{oxprice price=$oxcmp_basket->getNettoSum() currency=$currency}]</td>
                            </tr>
                        [{/block}]
                    [{else}]
                         [{block name="checkout_basketcontents_discounttotalgross"}]
                            <tr>
                                <th>[{oxmultilang ident="TOTAL_GROSS" suffix="COLON"}]</th>
                                <td id="basketTotalProductsGross" class="text-end">[{oxprice price=$oxcmp_basket->getBruttoSum() currency=$currency}]</td>
                            </tr>
                        [{/block}]
                    [{/if}]

                    [{block name="checkout_basketcontents_discounts"}]
                        [{foreach from=$oxcmp_basket->getDiscounts() item=oDiscount name=test_Discounts}]
                            <tr>
                                <th>
                                    [{if $oDiscount->dDiscount < 0}]
                                        [{oxmultilang ident="SURCHARGE"}]
                                    [{else}]
                                        [{oxmultilang ident="DISCOUNT"}]
                                    [{/if}]
                                    [{$oDiscount->sDiscount}]
                                </th>
                                <td class="text-end text-primary">
                                    [{oxprice price=$oDiscount->dDiscount*-1 currency=$currency}]
                                </td>
                            </tr>
                        [{/foreach}]
                    [{/block}]

                    [{if !$oxcmp_basket->isPriceViewModeNetto()}]
                        [{block name="checkout_basketcontents_totalnet"}]
                            <tr>
                                <th>[{oxmultilang ident="TOTAL_NET"}]</th>
                                <td id="basketTotalNetto" class="text-end">[{oxprice price=$oxcmp_basket->getNettoSum() currency=$currency}]</td>
                            </tr>
                        [{/block}]
                    [{/if}]

                    [{block name="checkout_basketcontents_productvats"}]
                        [{foreach from=$oxcmp_basket->getProductVats(false) item=VATitem key=key}]
                            <tr>
                                <th>[{oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$key}]</th>
                                <td class="text-end">[{oxprice price=$VATitem currency=$currency}]</td>
                            </tr>
                        [{/foreach}]
                    [{/block}]

                    [{if $oxcmp_basket->isPriceViewModeNetto()}]
                        [{block name="checkout_basketcontents_totalgross"}]
                            <tr>
                                <th>[{oxmultilang ident="TOTAL_GROSS" suffix="COLON"}]</th>
                                <td id="basketTotalGross" class="text-end">[{oxprice price=$oxcmp_basket->getBruttoSum() currency=$currency}]</td>
                            </tr>
                        [{/block}]
                    [{/if}]
                [{/if}]
            [{/block}]

            [{block name="checkout_basketcontents_voucherdiscount"}]
                [{if $oViewConf->getShowVouchers() && $oxcmp_basket->getVoucherDiscValue()}]
                    [{foreach from=$oxcmp_basket->getVouchers() item=sVoucher key=key name=Voucher}]
                        <tr class="couponData">
                            <th><span class="lead">[{oxmultilang ident="COUPON"}]&nbsp;([{oxmultilang ident="NUMBER"}] [{$sVoucher->sVoucherNr}])</span>
                            [{if $editable}]
                                <a href="[{$oViewConf->getSelfLink()}]&amp;cl=basket&amp;fnc=removeVoucher&amp;voucherId=[{$sVoucher->sVoucherId}]&amp;CustomError=basket&amp;stoken=[{$oViewConf->getSessionChallengeToken()}]" class="removeFn">[{oxmultilang ident="REMOVE"}]</a>
                            [{/if}]
                            </th>
                            <td class="lead text-end">[{oxprice price=$sVoucher->dVoucherdiscount*-1 currency=$currency}]</td>
                        </tr>
                    [{/foreach}]
                [{/if}]
            [{/block}]

            [{block name="checkout_basketcontents_delcosts"}]
                [{assign var="deliveryCost" value=$oxcmp_basket->getDeliveryCost()}]
                [{if $deliveryCost && ($oxcmp_basket->getBasketUser() || $oViewConf->isFunctionalityEnabled('blCalculateDelCostIfNotLoggedIn') ) }]
                    [{if $oViewConf->isFunctionalityEnabled('blShowVATForDelivery') }]
                        <tr>
                            <th>[{ oxmultilang ident="SHIPPING_NET" suffix="COLON" }]</th>
                            <td id="basketDeliveryNetto" class="text-end">[{oxprice price=$deliveryCost->getNettoPrice() currency=$currency }]</td>
                        </tr>
                        [{if $deliveryCost->getVatValue()}]
                        <tr>
                            [{if $oxcmp_basket->isProportionalCalculationOn() }]
                                <th>[{oxmultilang ident="BASKET_TOTAL_PLUS_PROPORTIONAL_VAT" suffix="COLON"}]</th>
                            [{else}]
                                <th>[{oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$deliveryCost->getVat()}]</th>
                            [{/if}]
                            <td id="basketDeliveryVat" class="text-end">[{oxprice price=$deliveryCost->getVatValue() currency=$currency}]</td>
                        </tr>
                        [{/if}]
                    [{else}]
                    <tr>
                        <th>[{ oxmultilang ident="SHIPPING_COST" suffix="COLON" }]</th>
                        <td id="basketDeliveryGross" class="text-end">[{oxprice price=$deliveryCost->getBruttoPrice() currency=$currency}]</td>
                    </tr>
                    [{/if}]
                [{/if}]
            [{/block}]

            [{block name="checkout_basketcontents_paymentcosts"}]
                [{assign var="paymentCost" value=$oxcmp_basket->getPaymentCost()}]
                [{if $paymentCost && $paymentCost->getPrice() }]
                    [{if $oViewConf->isFunctionalityEnabled('blShowVATForPayCharge') }]
                        <tr>
                            <th>[{if $paymentCost->getPrice() >= 0}][{ oxmultilang ident="SURCHARGE" }][{else}][{ oxmultilang ident="DEDUCTION" }][{/if}] [{ oxmultilang ident="PAYMENT_METHOD" suffix="COLON"}]</th>
                            <td id="basketPaymentNetto">[{oxprice price=$paymentCost->getNettoPrice() currency=$currency }]</td>
                        </tr>
                        [{if $paymentCost->getVatValue()}]
                            <tr>
                                [{if $oxcmp_basket->isProportionalCalculationOn() }]
                                    <th>[{ oxmultilang ident="BASKET_TOTAL_PLUS_PROPORTIONAL_VAT" suffix="COLON" }]</th>
                                [{else}]
                                    <th>[{ oxmultilang ident="SURCHARGE_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$paymentCost->getVat() }]</th>
                                [{/if}]
                                <td id="basketPaymentVat">[{oxprice price=$paymentCost->getVatValue() currency=$currency }]</td>
                            </tr>
                        [{/if}]
                    [{else}]
                        <tr>
                            <th>[{if $paymentCost->getPrice() >= 0}][{ oxmultilang ident="SURCHARGE" }][{else}][{ oxmultilang ident="DEDUCTION" }][{/if}] [{ oxmultilang ident="PAYMENT_METHOD" suffix="COLON" }]</th>
                            <td id="basketPaymentGross" class="text-end">[{oxprice price=$paymentCost->getBruttoPrice() currency=$currency }]</td>
                        </tr>
                    [{/if}]
                [{/if}]
            [{/block}]

            [{block name="checkout_basketcontents_wrappingcosts"}]
                [{if $oViewConf->getShowGiftWrapping() }]

                    [{assign var="wrappingCost" value=$oxcmp_basket->getWrappingCost()}]
                    [{if $wrappingCost && $wrappingCost->getPrice() > 0 }]
                        [{if $oViewConf->isFunctionalityEnabled('blShowVATForWrapping') }]
                            <tr>
                                <th>[{ oxmultilang ident="BASKET_TOTAL_WRAPPING_COSTS_NET" suffix="COLON" }]</th>
                                <td id="basketWrappingNetto" class="text-end">[{oxprice price=$wrappingCost->getNettoPrice() currency=$currency}]</td>
                            </tr>
                            [{if $oxcmp_basket->getWrappCostVat() }]
                                <tr>
                                    <th>[{ oxmultilang ident="PLUS_VAT" suffix="COLON" }]</th>
                                    <td id="basketWrappingVat" class="text-end">[{oxprice price=$wrappingCost->getVatValue() currency=$currency}]</td>
                                </tr>
                            [{/if}]
                        [{else}]
                            <tr>
                                <th>[{ oxmultilang ident="GIFT_WRAPPING" suffix="COLON" }]</th>
                                <td id="basketWrappingGross" class="text-end">[{oxprice price=$wrappingCost->getBruttoPrice() currency=$currency }]</td>
                            </tr>
                        [{/if}]
                    [{/if}]

                    [{assign var="giftCardCost" value=$oxcmp_basket->getGiftCardCost()}]
                    [{if $giftCardCost && $giftCardCost->getPrice() > 0 }]
                        [{if $oViewConf->isFunctionalityEnabled('blShowVATForWrapping') }]
                            <tr>
                                <th>[{ oxmultilang ident="BASKET_TOTAL_GIFTCARD_COSTS_NET" suffix="COLON" }]</th>
                                <td id="basketGiftCardNetto" class="text-end">[{oxprice price=$giftCardCost->getNettoPrice() currency=$currency }]</td>
                            </tr>
                            <tr>
                                [{if $oxcmp_basket->isProportionalCalculationOn() }]
                                    <th>[{ oxmultilang ident="BASKET_TOTAL_PLUS_PROPORTIONAL_VAT" suffix="COLON" }]</th>
                                [{else}]
                                <th>[{ oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$giftCardCost->getVat() }] </th>
                                [{/if}]
                                <td id="basketGiftCardVat" class="text-end">[{oxprice price=$giftCardCost->getVatValue() currency=$currency}]</td>
                            </tr>
                        [{else}]
                            <tr>
                                <th>[{ oxmultilang ident="GREETING_CARD" suffix="COLON" }]</th>
                                <td id="basketGiftCardGross" class="text-end">[{oxprice price=$giftCardCost->getBruttoPrice() currency=$currency}]</td>
                            </tr>
                        [{/if}]
                    [{/if}]
                [{/if}]
            [{/block}]

            [{block name="checkout_basketcontents_grandtotal"}]
                <tr class="basket__summary-total">
                    <th class="lead">[{oxmultilang ident="GRAND_TOTAL" suffix="COLON"}]</th>
                    <td class="lead text-primary text-end">[{oxprice price=$oxcmp_basket->getPrice() currency=$currency}]</td>
                </tr>
            [{/block}]

            [{if $oxcmp_basket->hasSkipedDiscount()}]
                <tr>
                    <th><span class="note">**</span> [{oxmultilang ident="MESSAGE_COUPON_NOT_APPLIED_FOR_ARTICLES"}]</span></th>
                    <td></td>
                </tr>
            [{/if}]
        </table>
    </div>
[{/block}]

[{if $oViewConf->getShowVouchers() && $oViewConf->getActiveClassName() == 'basket'}]
    [{block name="checkout_basket_vouchers"}]
        <div class="basket__voucher">
            <form name="voucher" action="[{$oViewConf->getSelfActionLink()}]" method="post">

                <div class="d-none">
                    [{$oViewConf->getHiddenSid()}]
                    <input type="hidden" name="cl" value="basket">
                    <input type="hidden" name="fnc" value="addVoucher">
                    <input type="hidden" name="CustomError" value="basket">
                </div>

                <button class="btn basket__voucher-collapse" type="button" data-bs-toggle="collapse" data-bs-target="#basket__voucher-input" aria-controls="basket__voucher-input" aria-expanded="false">
                    [{oxmultilang ident="O3_ORDER_COUPON_I_HAVE"}]
                </button>

                <div class="input-group collapse" id="basket__voucher-input">
                    <input type="text" name="voucherNr" size="30" class="form-control" placeholder="[{oxmultilang ident="ENTER_COUPON_NUMBER"}]">
                    <button type="submit" class="btn btn-primary">[{oxmultilang ident="O3_ORDER_COUPON_REDEEM"}]</button>
                </div>

                [{foreach from=$Errors.basket item=oEr key=key}]
                    [{if $oEr->getErrorClassType() == 'oxVoucherException'}]
                        <div class="alert alert-danger">
                            [{oxmultilang ident="COUPON_NOT_ACCEPTED" args=$oEr->getValue('voucherNr')}]
                            <strong>[{oxmultilang ident="REASON" suffix="COLON"}]</strong>
                            [{$oEr->getOxMessage()}]
                        </div>
                    [{/if}]
                [{/foreach}]

            </form>
        </div>
    [{/block}]
[{/if}]