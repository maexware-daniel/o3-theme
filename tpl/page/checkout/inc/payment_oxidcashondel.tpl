<div class="form-check">
    <input value="[{$sPaymentID}]" class="form-check-input" type="radio" name="paymentid" id="payment_[{$sPaymentID}]" [{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]checked[{/if}]>
    <label class="form-check-label" for="payment_[{$sPaymentID}]">
        <span>
            [{$paymentmethod->oxpayments__oxdesc->value}]

            [{if $paymentmethod->getPrice()}]
                [{assign var="oPaymentPrice" value=$paymentmethod->getPrice()}]
                [{if $oViewConf->isFunctionalityEnabled('blShowVATForPayCharge')}]
                    ([{oxprice price=$oPaymentPrice->getNettoPrice() currency=$currency}]
                    [{if $oPaymentPrice->getVatValue() > 0}]
                        [{oxmultilang ident="PLUS_VAT"}] [{oxprice price=$oPaymentPrice->getVatValue() currency=$currency}]
                    [{/if}])
                [{else}]
                    ([{oxprice price=$oPaymentPrice->getBruttoPrice() currency=$currency}])
                [{/if}]
            [{/if}]
        </span>

        [{block name="checkout_payment_longdesc"}]
            [{if $paymentmethod->oxpayments__oxlongdesc->value}]
                <span class="desc">
                    [{$paymentmethod->oxpayments__oxlongdesc->getRawValue()}]
                </span>
            [{/if}]
        [{/block}]

    </label>
</div>
