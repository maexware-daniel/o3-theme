[{assign var="dynvalue" value=$oView->getDynValue()}]
<div class="form-check">
    <input value="[{$sPaymentID}]" class="form-check-input" type="radio" name="paymentid" id="payment_[{$sPaymentID}]" [{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]checked[{/if}]>
    <label class="form-check-label" for="payment_[{$sPaymentID}]">
        <span>[{$paymentmethod->oxpayments__oxdesc->value}]</span>

        <div class="input-group mb-3 row">
            <label class="req control-label col-lg-4">[{oxmultilang ident="BANK"}]</label>
            <div class="col-lg-8">
                <input id="payment_[{$sPaymentID}]_1" class="form-control js-oxValidate js-oxValidate_notEmpty" type="text" size="20" maxlength="64" name="dynvalue[lsbankname]" value="[{$dynvalue.lsbankname}]" required="required">
            </div>
        </div>
        <div class="input-group mb-3 row">
            <label class="req control-label col-lg-4">[{oxmultilang ident="BANK_CODE"}]</label>
            <div class="col-lg-8">
                <input type="text" class="form-control js-oxValidate js-oxValidate_notEmpty" size="20" maxlength="64" name="dynvalue[lsblz]" value="[{$dynvalue.lsblz}]" required="required">
            </div>
        </div>
        <div class="input-group mb-3 row">
            <label class="req control-label col-lg-4">[{oxmultilang ident="BANK_ACCOUNT_NUMBER"}]</label>
            <div class="col-lg-8">
                <input type="text" class="form-control js-oxValidate js-oxValidate_notEmpty" size="20" maxlength="64" name="dynvalue[lsktonr]" value="[{$dynvalue.lsktonr}]" required="required">
            </div>
        </div>
        <div class="input-group mb-3 row">
            <label class="req control-label col-lg-4">[{oxmultilang ident="BANK_ACCOUNT_HOLDER"}]</label>
            <div class="col-lg-8">
                <input type="text" class="form-control js-oxValidate js-oxValidate_notEmpty" size="20" maxlength="64" name="dynvalue[lsktoinhaber]" value="[{if $dynvalue.lsktoinhaber}][{$dynvalue.lsktoinhaber}][{else}][{$oxcmp_user->oxuser__oxfname->value}] [{$oxcmp_user->oxuser__oxlname->value}][{/if}]" required="required">
            </div>
        </div>

        [{block name="checkout_payment_longdesc"}]
            [{if $paymentmethod->oxpayments__oxlongdesc->value}]
                <div class="row input-group">

                    <div class="col-12">
                        <div class="alert alert-info desc">
                           [{$paymentmethod->oxpayments__oxlongdesc->getRawValue()}]
                        </div>
                    </div>
                </div>
            [{/if}]
        [{/block}]
    </label>
</div>