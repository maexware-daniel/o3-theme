
[{*capture assign="sValidationJS"}]
    [{strip}]
        $('input,select,textarea').not('[type=submit]').jqBootstrapValidation(
            {
                filter: function()
                {
                    return $(this).is(':visible');
                }
            }
        );
    [{/strip}]
[{/capture*}]

[{*oxscript add=$sValidationJS*}]
[{block name="user"}]

    [{if $oxcmp_shop->oxshops__oxproductive->value}]
        [{oxscript include="js/widget/shippingaddress.min.js" priority=10}]
    [{else}]
        [{oxscript include="js/widget/shippingaddress.js" priority=10}]
    [{/if}]

    <form action="[{$oViewConf->getSelfActionLink()}]" name="order" method="post" class="needs-validation" novalidate>
        [{block name="user_form"}]
            [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]

            <div class="d-none">
                [{$oViewConf->getHiddenSid()}]
                [{$oViewConf->getNavFormParams()}]
                <input type="hidden" name="fnc" value="changeuser_testvalues">
                <input type="hidden" name="cl" value="account_user">
                <input type="hidden" name="CustomError" value='user'>
                <input type="hidden" name="blshowshipaddress" value="1">
            </div>

            [{* Rechnungsadresse *}]
            <div class="user__billingaddress mb-5">
                <h3 class="title-small">
                    [{block name="user_billing_address_head"}]
                        [{oxmultilang ident="BILLING_ADDRESS"}]
                        <button type="button" type="button" class="btn btn-edit" data-bs-toggle="collapse" data-bs-target="#user__billingaddress-address, #user__billingaddress-form" aria-controls="user__billingaddress-address, user__billingaddress-form">
                            [{oxmultilang ident="CHANGE"}]
                        </button>
                    [{/block}]
                </h3>

                [{block name="user_billing_address"}]
                    [{block name="user_billing_address_text"}]
                        [{include file="widget/address/billing_address.tpl" collapse="user__billingaddress-address"}]
                    [{/block}]
                    [{block name="user_billing_address_form"}]
                        <div id="user__billingaddress-form" class="user__billingaddress-form collapse">
                            [{include file="form/fieldset/user_email.tpl"}]
                            [{include file="form/fieldset/user_billing.tpl" noFormSubmit=true}]
                        </div>
                    [{/block}]
                [{/block}]

            </div>

            [{*oxscript add="$('#userChangeAddress').click( function() { $('#addressForm, #addressText').toggle();return false;});"*}]

            [{* Lieferadresse *}]
            [{block name="user_shipping_address"}]
                <div class="user__shippingaddress mb-5">
                    <h3 class="title-small">
                        [{block name="user_shipping_address_head"}]
                            [{oxmultilang ident="SHIPPING_ADDRESSES"}]
                        [{/block}]
                    </h3>

                    [{block name="user_shipping_address_choice"}]
                        <div class="form-check">
                            <input data-bs-toggle="collapse" data-bs-target="#user__shippingaddress-change" class="form-check-input" type="checkbox" name="blshowshipaddress" value="0" id="user__shippingaddress-chance"[{if !$oView->showShipAddress()}] checked[{/if}] aria-controls="user__shippingaddress-change">
                            <label class="form-check-label" for="user__shippingaddress-chance">
                                [{oxmultilang ident="USE_BILLINGADDRESS_FOR_SHIPPINGADDRESS"}]
                            </label>
                        </div>
                    [{/block}]

                    [{block name="user_shipping_address_form"}]
                        <div id="user__shippingaddress-change" class="user__shippingaddress-change collapse[{if $oView->showShipAddress()}] show[{/if}]">
                            [{include file="form/fieldset/user_shipping.tpl" noFormSubmit=true}]
                        </div>
                    [{/block}]
                </div>

                [{*oxscript add="$('#showShipAddress').change( function() { $('#shippingAddress').toggle($(this).is(':not(:checked)')); });"*}]
            [{/block}]

            <button id="accUserSaveTop" class="btn btn-primary" name="userform" type="submit">[{oxmultilang ident="SAVE"}]</button>

        [{/block}]
    </form>
    [{include file="form/fieldset/delete_shipping_address_modal.tpl"}]
[{/block}]
