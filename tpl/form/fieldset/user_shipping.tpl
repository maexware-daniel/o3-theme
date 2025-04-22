[{if $oxcmp_user}]
    [{assign var="delivadr" value=$oxcmp_user->getSelectedAddress()}]
[{/if}]

[{if !$deladr}]
    [{assign var="oConfig" value=$oView->getConfig()}]
    [{assign var="deladr"  value=$oConfig->getRequestParameter('deladr')}]
[{/if}]

[{if $oxcmp_user}]
    [{assign var="aUserAddresses" value=$oxcmp_user->getUserAddresses()}]

    [{if $aUserAddresses|@count > 0}]

        <input type="hidden" class="hidden" name="changeClass" value="[{$onChangeClass|default:'account_user'}]">

        [{*oxscript include="js/widgets/oxusershipingaddressselect.min.js" priority=10*}]
        [{*oxscript add="$( '.dd-add-delivery-address' ).click( function() {  $('.dd-available-addresses .dd-action').remove(); $( this ).find( 'label.btn' ).button('toggle'); } );"*}]
        [{*oxscript add="$( 'input[name=\"oxaddressid\"]' ).oxUserShipingAddressSelect();"*}]

        [{block name="form_user_shipping_address_select"}]

            [{foreach from=$aUserAddresses item=address name="shippingAdresses"}]

                <div class="form-check">
                    <input class="form-check-input" type="radio" name="oxaddressid" value="[{$address->oxaddress__oxid->value}]" id="address_[{$address->oxaddress__oxid->value}]"[{if $address->isSelected()}] checked[{/if}]>
                    <label class="form-check-label" for="address_[{$address->oxaddress__oxid->value}]">
                        [{block name="form_user_shipping_address_actions"}]
                            [{if $address->isSelected()}]
                                [{block name="form_user_shipping_address_edit_action"}]
                                    <button class="btn btn-edit" type="button" data-bs-toggle="collapse" data-bs-target="#user_shipppingaddress-address_[{$address->oxaddress__oxid->value}], #user__shippingaddress-form_[{$address->oxaddress__oxid->value}], #delete_[{$address->oxaddress__oxid->value}]" aria-controls="user_shipppingaddress-address_[{$address->oxaddress__oxid->value}], user__shippingaddress-form_[{$address->oxaddress__oxid->value}], delete_[{$address->oxaddress__oxid->value}]">
                                        [{oxmultilang ident="CHANGE"}]
                                    </button>
                                [{/block}]
                                [{block name="form_user_shipping_address_delete_action"}]
                                    <button class="btn btn-delete collapse show"
                                            type="button"
                                            id="delete_[{$address->oxaddress__oxid->value}]"
                                            title="[{oxmultilang ident="DD_DELETE"}]"
                                            data-bs-toggle="modal"
                                            data-bs-target="#delete_shipping_address_[{$smarty.foreach.shippingAdresses.iteration}]"
                                            aria-controls="delete_shipping_address_[{$smarty.foreach.shippingAdresses.iteration}]">
                                        <svg width="18" height="20" viewBox="0 0 18 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M5.4375 2.3125H5.25C5.35313 2.3125 5.4375 2.22812 5.4375 2.125V2.3125ZM5.4375 2.3125H12.5625V2.125C12.5625 2.22812 12.6469 2.3125 12.75 2.3125H12.5625V4H14.25V2.125C14.25 1.29766 13.5773 0.625 12.75 0.625H5.25C4.42266 0.625 3.75 1.29766 3.75 2.125V4H5.4375V2.3125ZM17.25 4H0.75C0.335156 4 0 4.33516 0 4.75V5.5C0 5.60313 0.084375 5.6875 0.1875 5.6875H1.60312L2.18203 17.9453C2.21953 18.7445 2.88047 19.375 3.67969 19.375H14.3203C15.1219 19.375 15.7805 18.7469 15.818 17.9453L16.3969 5.6875H17.8125C17.9156 5.6875 18 5.60313 18 5.5V4.75C18 4.33516 17.6648 4 17.25 4ZM14.1398 17.6875H3.86016L3.29297 5.6875H14.707L14.1398 17.6875Z" fill="#D4D4D4"/>
                                        </svg>
                                    </button>
                                [{/block}]
                            [{/if}]
                        [{/block}]

                        [{include file="widget/address/shipping_address.tpl" delivadr=$address oxid=$address->oxaddress__oxid->value}]

                        [{if $address->isSelected()}]
                            <div class="user__shippingaddress-form collapse" id="user__shippingaddress-form_[{$address->oxaddress__oxid->value}]">
                                [{* Anrede *}]
                                [{if $oView->isFieldRequired(oxaddress__oxsal)}]
                                    [{assign var="salRequired" value=true}]
                                [{/if}]
                                <div class="form-floating mb-3">
                                    [{include file="form/fieldset/salutation.tpl" name="deladr[oxaddress__oxsal]" value=$delivadr->oxaddress__oxsal->value value2=$deladr.oxaddress__oxsal class="form-select" id="deladr_oxaddress__oxsal" required=$salRequired}]
                                    <label for="deladr_oxaddress__oxsal">[{oxmultilang ident="TITLE"}]</label>
                                    <div class="invalid-feedback">
                                        [{oxmultilang ident="DD_FORM_VALIDATION_TITLE"}]
                                    </div>
                                </div>

                                [{* Vorname *}]
                                <div class="form-floating mb-3">
                                    <input class="form-control" type="text" maxlength="255" name="deladr[oxaddress__oxfname]" id="deladr_oxaddress__oxfname" placeholder="[{oxmultilang ident="FIRST_NAME"}]" autocomplete="shipping given-name" value="[{if isset( $delivadr->oxaddress__oxfname->value )}][{$delivadr->oxaddress__oxfname->value}][{else}][{$deladr.oxaddress__oxfname}][{/if}]"[{if $oView->isFieldRequired(oxaddress__oxfname)}] required[{/if}]>
                                    <label for="deladr_oxaddress__oxfname">[{oxmultilang ident="FIRST_NAME"}]</label>
                                    <div class="invalid-feedback">
                                        [{oxmultilang ident="DD_FORM_VALIDATION_FIRST_NAME"}]
                                    </div>
                                </div>

                                [{* Nachname *}]
                                <div class="form-floating mb-3">
                                    <input class="form-control" type="text" maxlength="255" name="deladr[oxaddress__oxlname]" id="deladr_oxaddress__oxlname" placeholder="[{oxmultilang ident="LAST_NAME"}]" autocomplete="shipping family-name" value="[{if isset( $delivadr->oxaddress__oxlname->value )}][{$delivadr->oxaddress__oxlname->value}][{else}][{$deladr.oxaddress__oxlname}][{/if}]"[{if $oView->isFieldRequired(oxaddress__oxlname)}] required[{/if}]>
                                    <label for="deladr_oxaddress__oxlname">[{oxmultilang ident="LAST_NAME"}]</label>
                                    <div class="invalid-feedback">
                                        [{oxmultilang ident="DD_FORM_VALIDATION_LAST_NAME"}]
                                    </div>
                                </div>

                                [{* Firma *}]
                                <div class="form-floating mb-3">
                                    <input class="form-control" type="text" maxlength="255" name="deladr[oxaddress__oxcompany]" id="deladr_oxaddress__oxcompany" placeholder="[{oxmultilang ident="COMPANY"}]" autocomplete="shipping organization" value="[{if isset( $delivadr->oxaddress__oxcompany->value )}][{$delivadr->oxaddress__oxcompany->value}][{else}][{$deladr.oxaddress__oxcompany}][{/if}]"[{if $oView->isFieldRequired(oxaddress__oxcompany)}] required[{/if}]>
                                    <label for="deladr_oxaddress__oxcompany">[{oxmultilang ident="COMPANY"}]</label>
                                    <div class="invalid-feedback">
                                        [{oxmultilang ident="DD_FORM_VALIDATION_COMPANY"}]
                                    </div>
                                </div>

                                [{* Zusätzliche Informationen *}]
                                <div class="form-floating mb-3">
                                    <input class="form-control" type="text" maxlength="255" name="deladr[oxaddress__oxaddinfo]" id="deladr_oxaddress__oxaddinfo" placeholder="[{oxmultilang ident="ADDITIONAL_INFO"}]" value="[{if isset( $delivadr->oxaddress__oxaddinfo->value )}][{$delivadr->oxaddress__oxaddinfo->value}][{else}][{$deladr.oxaddress__oxaddinfo}][{/if}]"[{if $oView->isFieldRequired(oxaddress__oxaddinfo)}] required[{/if}]>
                                    <label for="deladr_oxaddress__oxaddinfo">[{oxmultilang ident="ADDITIONAL_INFO"}]</label>
                                </div>

                                [{* Straße und Hausnummer *}]
                                <div class="row">
                                    <div class="form-floating mb-3 col-xl-8 pe-xl-0">
                                        <input class="form-control" type="text" maxlength="255" name="deladr[oxaddress__oxstreet]" id="deladr_oxaddress__oxstreet" placeholder="[{oxmultilang ident="O3_STREET"}]" autocomplete="shipping street-address" value="[{if isset( $delivadr->oxaddress__oxstreet->value )}][{$delivadr->oxaddress__oxstreet->value}][{else}][{$deladr.oxaddress__oxstreet}][{/if}]"[{if $oView->isFieldRequired(oxaddress__oxstreet)}] required[{/if}]>
                                        <label for="deladr_oxaddress__oxstreet">[{oxmultilang ident="O3_STREET"}]</label>
                                        <div class="invalid-feedback">
                                            [{oxmultilang ident="DD_FORM_VALIDATION_STREET"}]
                                        </div>
                                    </div>
                                    <div class="form-floating mb-3 col-xl-4">
                                        <input class="form-control" type="text" maxlength="16" name="deladr[oxaddress__oxstreetnr]" id="deladr_oxaddress__oxstreetnr" placeholder="[{oxmultilang ident="O3_STREETNO"}]" value="[{if isset( $delivadr->oxaddress__oxstreetnr->value )}][{$delivadr->oxaddress__oxstreetnr->value}][{else}][{$deladr.oxaddress__oxstreetnr}][{/if}]"[{if $oView->isFieldRequired(oxaddress__oxstreetnr)}] required[{/if}]>
                                        <label for="deladr_oxaddress__oxstreetnr">[{oxmultilang ident="O3_STREETNO"}]</label>
                                        <div class="invalid-feedback">
                                            [{oxmultilang ident="DD_FORM_VALIDATION_STREETNO"}]
                                        </div>
                                    </div>
                                </div>

                                [{* PLZ und Ort *}]
                                <div class="row">
                                    <div class="form-floating mb-3 col-xl-4">
                                        <input class="form-control" type="text" maxlength="50" name="deladr[oxaddress__oxzip]" id="deladr_oxaddress__oxzip" placeholder="[{oxmultilang ident="O3_POSTAL_CODE"}]" autocomplete="shipping postal-code" value="[{if isset( $delivadr->oxaddress__oxzip->value )}][{$delivadr->oxaddress__oxzip->value}][{else}][{$deladr.oxaddress__oxzip}][{/if}]"[{if $oView->isFieldRequired(oxaddress__oxzip)}] required[{/if}]>
                                        <label for="deladr_oxaddress__oxzip">[{oxmultilang ident="O3_POSTAL_CODE"}]</label>
                                        <div class="invalid-feedback">
                                            [{oxmultilang ident="DD_FORM_VALIDATION_POSTAL_CODE"}]
                                        </div>
                                    </div>
                                    <div class="form-floating mb-3 col-xl-8 ps-xl-0">
                                        <input class="form-control" type="text" maxlength="255" name="deladr[oxaddress__oxcity]" id="deladr_oxaddress__oxcity" placeholder="[{oxmultilang ident="O3_CITY"}]" autocomplete="shipping locality" value="[{if isset( $delivadr->oxaddress__oxcity->value )}][{$delivadr->oxaddress__oxcity->value}][{else}][{$deladr.oxaddress__oxcity}][{/if}]"[{if $oView->isFieldRequired(oxaddress__oxcity)}] required[{/if}]>
                                        <label for="deladr_oxaddress__oxcity">[{oxmultilang ident="O3_CITY"}]</label>
                                        <div class="invalid-feedback">
                                            [{oxmultilang ident="DD_FORM_VALIDATION_CITY"}]
                                        </div>
                                    </div>
                                </div>

                                [{block name="form_user_shipping_country"}]
                                    <div class="form-floating mb-3">
                                        <select class="form-select" id="delCountrySelect" name="deladr[oxaddress__oxcountryid]"[{if $oView->isFieldRequired(oxaddress__oxcountryid)}] required[{/if}] autocomplete="shipping country">
                                            <option value="">-</option>
                                            [{assign var="blCountrySelected" value=false}]
                                            [{foreach from=$oViewConf->getCountryList() item=country key=country_id}]
                                            [{assign var="sCountrySelect" value=""}]
                                            [{if !$blCountrySelected}]
                                            [{if (isset($deladr.oxaddress__oxcountryid) && $deladr.oxaddress__oxcountryid == $country->oxcountry__oxid->value) ||
                                        (!isset($deladr.oxaddress__oxcountryid) && ($delivadr->oxaddress__oxcountry->value == $country->oxcountry__oxtitle->value or
                                        $delivadr->oxaddress__oxcountry->value == $country->oxcountry__oxid->value or
                                        $delivadr->oxaddress__oxcountryid->value == $country->oxcountry__oxid->value))}]
                                            [{assign var="blCountrySelected" value=true}]
                                            [{assign var="sCountrySelect" value="selected"}]
                                            [{/if}]
                                            [{/if}]
                                            <option value="[{$country->oxcountry__oxid->value}]" [{$sCountrySelect}]>[{$country->oxcountry__oxtitle->value}]</option>
                                            [{/foreach}]
                                        </select>
                                        <label for="delCountrySelect">[{oxmultilang ident="COUNTRY"}]</label>
                                        <div class="invalid-feedback">
                                            [{oxmultilang ident="DD_FORM_VALIDATION_COUNTRY"}]
                                        </div>
                                    </div>

                                    <div class="form-floating mb-3">
                                        [{include file="form/fieldset/state.tpl"
                                        countrySelectId="delCountrySelect"
                                        stateSelectName="deladr[oxaddress__oxstateid]"
                                        selectedStateIdPrim=$deladr.oxaddress__oxstateid
                                        selectedStateId=$delivadr->oxaddress__oxstateid->value
                                        class="form-select"}]
                                        <label for="[{$countrySelectId}]">[{oxmultilang ident="DD_USER_LABEL_STATE"}]</label>
                                        <div class="invalid-feedback">
                                            [{oxmultilang ident="DD_FORM_VALIDATION_COUNTRY"}]
                                        </div>
                                    </div>
                                [{/block}]

                                [{* Telefon *}]
                                <div class="form-floating mb-3">
                                    <input class="form-control" type="text" maxlength="128" name="deladr[oxaddress__oxfon]" id="deladr_oxaddress__oxfon" placeholder="[{oxmultilang ident="PHONE"}]" autocomplete="shipping tel" value="[{if isset( $delivadr->oxaddress__oxfon->value )}][{$delivadr->oxaddress__oxfon->value}][{else}][{$deladr.oxaddress__oxfon}][{/if}]"[{if $oView->isFieldRequired(oxaddress__oxfon)}] required[{/if}]>
                                    <label for="deladr_oxaddress__oxfon">[{oxmultilang ident="PHONE"}]</label>
                                    <div class="invalid-feedback">
                                        [{oxmultilang ident="DD_FORM_VALIDATION_PHONE"}]
                                    </div>
                                </div>

                                [{* Telefax *}]
                                <div class="form-floating mb-3">
                                    <input class="form-control" type="text" maxlength="128" name="deladr[oxaddress__oxfax]" id="deladr_oxaddress__oxfax" placeholder="[{oxmultilang ident="FAX"}]" value="[{if isset( $delivadr->oxaddress__oxfax->value )}][{$delivadr->oxaddress__oxfax->value}][{else}][{$deladr.oxaddress__oxfax}][{/if}]"[{if $oView->isFieldRequired(oxaddress__oxfax)}] required[{/if}]>
                                    <label for="deladr_oxaddress__oxfax">[{oxmultilang ident="FAX"}]</label>
                                </div>
                                <div class="invalid-feedback">
                                    [{oxmultilang ident="DD_FORM_VALIDATION_FAX"}]
                                </div>

                                [{if !$noFormSubmit}]
                                    <div class="mb-3">
                                        <p class="alert alert-info">[{oxmultilang ident="COMPLETE_MARKED_FIELDS"}]</p>
                                        <button id="accUserSaveBottom" type="submit" name="save">[{oxmultilang ident="SAVE"}]</button>
                                    </div>
                                [{/if}]
                            </div>
                        [{/if}]
                    </label>
                </div>

            [{/foreach}]

            <div class="form-check">
                <input class="form-check-input" type="radio" name="oxaddressid" value="-1" id="address_new">
                <label class="form-check-label" for="address_new">
                    [{oxmultilang ident="DD_USER_SHIPPING_ADD_DELIVERY_ADDRESS"}]


                    <div class="user__shippingaddress-form">

                        [{* Anrede *}]
                        [{if $oView->isFieldRequired(oxaddress__oxsal)}]
                            [{assign var="salRequired" value=true}]
                        [{/if}]

                        <div class="form-floating mb-3">
                            [{include file="form/fieldset/salutation.tpl" name="deladr[oxaddress__oxsal]" value=$delivadr->oxaddress__oxsal->value value2=$deladr.oxaddress__oxsal class="form-select" id="deladr_oxaddress__oxsal" required=$salRequired disabled=true}]
                            <label for="deladr_oxaddress__oxsal">[{oxmultilang ident="TITLE"}]</label>
                            <div class="invalid-feedback">
                                [{oxmultilang ident="DD_FORM_VALIDATION_TITLE"}]
                            </div>
                        </div>

                        [{* Vorname *}]
                        <div class="form-floating mb-3">
                            <input disabled class="form-control" type="text" maxlength="255" name="deladr[oxaddress__oxfname]" id="deladr_oxaddress__oxfname" placeholder="[{oxmultilang ident="FIRST_NAME"}][{if $oView->isFieldRequired(oxaddress__oxfname)}]*[{/if}]" autocomplete="shipping given-name" value=""[{if $oView->isFieldRequired(oxaddress__oxfname)}] required[{/if}]>
                            <label for="deladr_oxaddress__oxfname">[{oxmultilang ident="FIRST_NAME"}][{if $oView->isFieldRequired(oxaddress__oxfname)}]*[{/if}]</label>
                            <div class="invalid-feedback">
                                [{oxmultilang ident="DD_FORM_VALIDATION_FIRST_NAME"}]
                            </div>
                            [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxfname}]
                        </div>

                        [{* Nachname *}]
                        <div class="form-floating mb-3">
                            <input disabled class="form-control" type="text" maxlength="255" name="deladr[oxaddress__oxlname]" id="deladr_oxaddress__oxlname" placeholder="[{oxmultilang ident="LAST_NAME"}][{if $oView->isFieldRequired(oxaddress__oxlname)}]*[{/if}]" autocomplete="shipping family-name" value=""[{if $oView->isFieldRequired(oxaddress__oxlname)}] required[{/if}]>
                            <label for="deladr_oxaddress__oxlname">[{oxmultilang ident="LAST_NAME"}][{if $oView->isFieldRequired(oxaddress__oxlname)}]*[{/if}]</label>
                            <div class="invalid-feedback">
                                [{oxmultilang ident="DD_FORM_VALIDATION_LAST_NAME"}]
                            </div>
                            [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxlname}]
                        </div>

                        [{* Firma *}]
                        <div class="form-floating mb-3">
                            <input disabled class="form-control" type="text" maxlength="255" name="deladr[oxaddress__oxcompany]" id="deladr_oxaddress__oxcompany" placeholder="[{oxmultilang ident="COMPANY"}][{if $oView->isFieldRequired(oxaddress__oxcompany)}]*[{/if}]" autocomplete="shipping organization" value=""[{if $oView->isFieldRequired(oxaddress__oxcompany)}] required[{/if}]>
                            <label for="deladr_oxaddress__oxcompany">[{oxmultilang ident="COMPANY"}][{if $oView->isFieldRequired(oxaddress__oxcompany)}]*[{/if}]</label>
                            <div class="invalid-feedback">
                                [{oxmultilang ident="DD_FORM_VALIDATION_COMPANY"}]
                            </div>
                            [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxcompany}]
                        </div>

                        [{* Zusätzliche Informationen *}]
                        <div class="form-floating mb-3">
                            <input disabled class="form-control" type="text" maxlength="255" name="deladr[oxaddress__oxaddinfo]" id="deladr_oxaddress__oxaddinfo" placeholder="[{oxmultilang ident="ADDITIONAL_INFO"}][{if $oView->isFieldRequired(oxaddress__oxaddinfo)}]*[{/if}]" value=""[{if $oView->isFieldRequired(oxaddress__oxaddinfo)}] required[{/if}]>
                            <label for="deladr_oxaddress__oxaddinfo">[{oxmultilang ident="ADDITIONAL_INFO"}][{if $oView->isFieldRequired(oxaddress__oxaddinfo)}]*[{/if}]</label>
                            [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxaddinfo}]
                        </div>

                        [{* Straße und Hausnummer *}]
                        <div class="row">
                            <div class="form-floating mb-3 col-xl-8 pe-xl-0">
                                <input disabled class="form-control" type="text" maxlength="255" name="deladr[oxaddress__oxstreet]" id="deladr_oxaddress__oxstreet" placeholder="[{oxmultilang ident="O3_STREET"}][{if $oView->isFieldRequired(oxaddress__oxstreet)}]*[{/if}]" autocomplete="shipping street-address" value=""[{if $oView->isFieldRequired(oxaddress__oxstreet)}] required[{/if}]>
                                <label for="deladr_oxaddress__oxstreet">[{oxmultilang ident="O3_STREET"}][{if $oView->isFieldRequired(oxaddress__oxstreet)}]*[{/if}]</label>
                                <div class="invalid-feedback">
                                    [{oxmultilang ident="DD_FORM_VALIDATION_STREET"}]
                                </div>
                                [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxstreet}]
                            </div>
                            <div class="form-floating mb-3 col-xl-4">
                                <input disabled class="form-control" type="text" maxlength="16" name="deladr[oxaddress__oxstreetnr]" id="deladr_oxaddress__oxstreetnr" placeholder="[{oxmultilang ident="O3_STREETNO"}][{if $oView->isFieldRequired(oxaddress__oxstreetnr)}]*[{/if}]" value=""[{if $oView->isFieldRequired(oxaddress__oxstreetnr)}] required[{/if}]>
                                <label for="deladr_oxaddress__oxstreetnr">[{oxmultilang ident="O3_STREETNO"}][{if $oView->isFieldRequired(oxaddress__oxstreetnr)}]*[{/if}]</label>
                                <div class="invalid-feedback">
                                    [{oxmultilang ident="DD_FORM_VALIDATION_STREETNO"}]
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-floating mb-3 col-xl-4">
                                <input disabled class="form-control" type="text" maxlength="50" name="deladr[oxaddress__oxzip]" id="deladr_oxaddress__oxzip" placeholder="[{oxmultilang ident="O3_POSTAL_CODE"}][{if $oView->isFieldRequired(oxaddress__oxzip)}]*[{/if}]" autocomplete="shipping postal-code" value=""[{if $oView->isFieldRequired(oxaddress__oxzip)}] required[{/if}]>
                                <label for="deladr_oxaddress__oxzip">[{oxmultilang ident="O3_POSTAL_CODE"}][{if $oView->isFieldRequired(oxaddress__oxzip)}]*[{/if}]</label>
                                <div class="invalid-feedback">
                                    [{oxmultilang ident="DD_FORM_VALIDATION_POSTAL_CODE"}]
                                </div>
                                [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxzip}]
                            </div>
                            <div class="form-floating mb-3 col-xl-8 ps-xl-0">
                                <input disabled class="form-control" type="text" maxlength="255" name="deladr[oxaddress__oxcity]" id="deladr_oxaddress__oxcity" placeholder="[{oxmultilang ident="O3_CITY"}][{if $oView->isFieldRequired(oxaddress__oxcity)}]*[{/if}]" autocomplete="shipping locality" value=""[{if $oView->isFieldRequired(oxaddress__oxcity)}] required[{/if}]>
                                <label for="deladr_oxaddress__oxcity">[{oxmultilang ident="O3_CITY"}][{if $oView->isFieldRequired(oxaddress__oxcity)}]*[{/if}]</label>
                                <div class="invalid-feedback">
                                    [{oxmultilang ident="DD_FORM_VALIDATION_CITY"}]
                                </div>
                                [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxcity}]
                            </div>
                        </div>

                        [{block name="form_user_shipping_country"}]
                            <div class="form-floating mb-3">
                                <select disabled class="form-select" id="delCountrySelect" name="deladr[oxaddress__oxcountryid]"[{if $oView->isFieldRequired(oxaddress__oxcountryid)}] required[{/if}] autocomplete="shipping country">
                                    <option value="">-</option>
                                    [{assign var="blCountrySelected" value=false}]
                                    [{foreach from=$oViewConf->getCountryList() item=country key=country_id}]
                                        [{assign var="sCountrySelect" value=""}]
                                        [{if !$blCountrySelected}]
                                            [{if (isset($deladr.oxaddress__oxcountryid) && $deladr.oxaddress__oxcountryid == $country->oxcountry__oxid->value) ||
                                        (!isset($deladr.oxaddress__oxcountryid) && ($delivadr->oxaddress__oxcountry->value == $country->oxcountry__oxtitle->value or
                                        $delivadr->oxaddress__oxcountry->value == $country->oxcountry__oxid->value or
                                        $delivadr->oxaddress__oxcountryid->value == $country->oxcountry__oxid->value))}]
                                            [{assign var="blCountrySelected" value=true}]
                                            [{assign var="sCountrySelect" value="selected"}]
                                            [{/if}]
                                        [{/if}]
                                        <option value="[{$country->oxcountry__oxid->value}]" [{$sCountrySelect}]>[{$country->oxcountry__oxtitle->value}]</option>
                                    [{/foreach}]
                                </select>
                                <label for="delCountrySelect">[{oxmultilang ident="COUNTRY"}][{if $oView->isFieldRequired(oxaddress__oxcountryid)}]*[{/if}]</label>
                                <div class="invalid-feedback">
                                    [{oxmultilang ident="DD_FORM_VALIDATION_COUNTRY"}]
                                </div>
                            </div>

                            <div class="form-floating mb-3">
                                    [{include file="form/fieldset/state.tpl"
                                    countrySelectId="delCountrySelect"
                                    stateSelectName="deladr[oxaddress__oxstateid]"
                                    selectedStateIdPrim=$deladr.oxaddress__oxstateid
                                    selectedStateId=$delivadr->oxaddress__oxstateid->value
                                    class="form-select"
                                    disabled=true}]
                                <label for="[{$countrySelectId}]">[{oxmultilang ident="DD_USER_LABEL_STATE"}]</label>
                                <div class="invalid-feedback">
                                    [{oxmultilang ident="DD_FORM_VALIDATION_COUNTRY"}]
                                </div>
                            </div>
                        [{/block}]

                        [{* Telefon *}]
                        <div class="form-floating mb-3">
                            <input disabled class="form-control" type="text" maxlength="128" name="deladr[oxaddress__oxfon]" id="deladr_oxaddress__oxfon" placeholder="[{oxmultilang ident="PHONE"}][{if $oView->isFieldRequired(oxaddress__oxfon)}]*[{/if}]" autocomplete="shipping tel" value=""[{if $oView->isFieldRequired(oxaddress__oxfon)}] required[{/if}]>
                            <label for="deladr_oxaddress__oxfon">[{oxmultilang ident="PHONE"}][{if $oView->isFieldRequired(oxaddress__oxfon)}]*[{/if}]</label>
                            <div class="invalid-feedback">
                                [{oxmultilang ident="DD_FORM_VALIDATION_PHONE"}]
                            </div>
                            [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxfon}]
                        </div>

                        [{* Telefax *}]
                        <div class="form-floating mb-3">
                            <input disabled class="form-control" type="text" maxlength="128" name="deladr[oxaddress__oxfax]" id="deladr_oxaddress__oxfax" placeholder="[{oxmultilang ident="FAX"}][{if $oView->isFieldRequired(oxaddress__oxfax)}]*[{/if}]" value=""[{if $oView->isFieldRequired(oxaddress__oxfax)}] required[{/if}]>
                            <label for="deladr_oxaddress__oxfax">[{oxmultilang ident="FAX"}][{if $oView->isFieldRequired(oxaddress__oxfax)}]*[{/if}]</label>
                            <div class="invalid-feedback">
                                [{oxmultilang ident="DD_FORM_VALIDATION_FAX"}]
                            </div>
                            [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxfax}]
                        </div>

                        [{if !$noFormSubmit}]
                            <div class="mb-3">
                                <p class="alert alert-info">[{oxmultilang ident="COMPLETE_MARKED_FIELDS"}]</p>
                                <button id="accUserSaveBottom" type="submit" name="save">[{oxmultilang ident="SAVE"}]</button>
                            </div>
                        [{/if}]
                    </div>
                </label>
            </div>
        [{/block}]

    [{/if}]
[{/if}]

[{* Just used for Registraion *}]
[{if !$delivadr}]
    <div class="user__shippingaddress-form">

        [{if $oView->isFieldRequired(oxaddress__oxsal)}]
            [{assign var="salRequired" value=true}]
        [{/if}]

        <div class="form-floating mb-3">
            [{include file="form/fieldset/salutation.tpl" name="deladr[oxaddress__oxsal]" value=$delivadr->oxaddress__oxsal->value value2=$deladr.oxaddress__oxsal class="form-select" id="deladr_oxaddress__oxsal" required=$salRequired disabled=true}]
            <label for="deladr_oxaddress__oxsal">[{oxmultilang ident="TITLE"}][{if $oView->isFieldRequired(oxaddress__oxsal)}]*[{/if}]</label>
            <div class="invalid-feedback">
                [{oxmultilang ident="DD_FORM_VALIDATION_TITLE"}]
            </div>
        </div>

        <div class="form-floating mb-3">
            <input disabled type="text" class="form-control" id="deladr_oxaddress__oxfname" name="deladr[oxaddress__oxfname]" maxlength="255" autocomplete="shipping given-name" value="[{if isset( $deladr.oxaddress__oxfname )}][{$deladr.oxaddress__oxfname}][{else}][{$delivadr->oxaddress__oxfname->value}][{/if}]" placeholder="[{oxmultilang ident="FIRST_NAME"}][{if $oView->isFieldRequired(oxaddress__oxfname)}]*[{/if}]"[{if $oView->isFieldRequired(oxaddress__oxfname)}] required[{/if}]>
            <label for="deladr_oxaddress__oxfname">[{oxmultilang ident="FIRST_NAME"}][{if $oView->isFieldRequired(oxaddress__oxfname)}]*[{/if}]</label>
            [{if $oView->isFieldRequired(oxaddress__oxfname)}]
                <div class="invalid-feedback">[{oxmultilang ident="DD_FORM_VALIDATION_FIRST_NAME"}]</div>
                [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxfname}]
            [{/if}]
        </div>

        <div class="form-floating mb-3">
            <input disabled type="text" class="form-control" id="deladr_oxaddress__oxlname" name="deladr[oxaddress__oxlname]" maxlength="255" autocomplete="shipping family-name" value="[{if isset( $deladr.oxaddress__oxlname )}][{$deladr.oxaddress__oxlname}][{else}][{$delivadr->oxaddress__oxlname->value}][{/if}]" placeholder="[{oxmultilang ident="LAST_NAME"}][{if $oView->isFieldRequired(oxaddress__oxlname)}]*[{/if}]"[{if $oView->isFieldRequired(oxaddress__oxlname)}] required[{/if}]>
            <label for="deladr_oxaddress__oxlname">[{oxmultilang ident="LAST_NAME"}][{if $oView->isFieldRequired(oxaddress__oxlname)}]*[{/if}]</label>
            [{if $oView->isFieldRequired(oxaddress__oxlname)}]
                <div class="invalid-feedback">[{oxmultilang ident="DD_FORM_VALIDATION_LAST_NAME"}]</div>
                [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxlname}]
            [{/if}]
        </div>

        <div class="form-floating mb-3">
            <input disabled type="text" class="form-control" id="deladr_oxaddress__oxcompany" name="deladr[oxaddress__oxcompany]" maxlength="255" autocomplete="shipping organization" value="[{if isset( $deladr.oxaddress__oxcompany )}][{$deladr.oxaddress__oxcompany}][{else}][{$delivadr->oxaddress__oxcompany->value}][{/if}]" placeholder="[{oxmultilang ident="COMPANY"}][{if $oView->isFieldRequired(oxaddress__oxcompany)}]*[{/if}]"[{if $oView->isFieldRequired(oxaddress__oxcompany)}] required[{/if}]>
            <label for="deladr_oxaddress__oxcompany">[{oxmultilang ident="COMPANY"}][{if $oView->isFieldRequired(oxaddress__oxcompany)}]*[{/if}]</label>
            [{if $oView->isFieldRequired(oxaddress__oxcompany)}]
                <div class="invalid-feedback">[{oxmultilang ident="DD_FORM_VALIDATION_COMPANY"}]</div>
                [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxcompany}]
            [{/if}]
        </div>

        <div class="form-floating mb-3">
            <input disabled type="text" class="form-control" id="deladr_oxaddress__oxaddinfo" name="deladr[oxaddress__oxaddinfo]" maxlength="255" value="[{if isset( $deladr.oxaddress__oxaddinfo )}][{$deladr.oxaddress__oxaddinfo}][{else}][{$delivadr->oxaddress__oxaddinfo->value}][{/if}]" placeholder="[{oxmultilang ident="ADDITIONAL_INFO"}][{if $oView->isFieldRequired(oxaddress__oxaddinfo)}]*[{/if}]"[{if $oView->isFieldRequired(oxaddress__oxaddinfo)}] required[{/if}]>
            <label for="deladr_oxaddress__oxaddinfo">[{oxmultilang ident="ADDITIONAL_INFO"}][{if $oView->isFieldRequired(oxaddress__oxaddinfo)}]*[{/if}]</label>
            [{if $oView->isFieldRequired(oxaddress__oxaddinfo)}]
                <div class="invalid-feedback">[{oxmultilang ident="DD_FORM_VALIDATION_ADDITIONAL_INFO"}]</div>
                [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxaddinfo}]
            [{/if}]
        </div>

        <div class="row">
            <div class="form-floating mb-3 col-xl-8 pe-xl-0">
                <input disabled class="form-control" type="text" maxlength="255" name="deladr[oxaddress__oxstreet]" id="deladr_oxaddress__oxstreet" value="[{if isset( $deladr.oxaddress__oxstreet )}][{$deladr.oxaddress__oxstreet}][{else}][{$delivadr->oxaddress__oxstreet->value}][{/if}]" placeholder="[{oxmultilang ident="O3_STREET"}][{if $oView->isFieldRequired(oxaddress__oxstreet)}]*[{/if}]" autocomplete="shipping street-address" value=""[{if $oView->isFieldRequired(oxaddress__oxstreet)}] required[{/if}]>
                <label for="deladr_oxaddress__oxstreet">[{oxmultilang ident="O3_STREET"}][{if $oView->isFieldRequired(oxaddress__oxstreet)}]*[{/if}]</label>
                [{if $oView->isFieldRequired(oxaddress__oxstreet)}]
                    <div class="invalid-feedback">
                        [{oxmultilang ident="DD_FORM_VALIDATION_STREET"}]
                    </div>
                    [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxstreet}]
                [{/if}]
            </div>
            <div class="form-floating mb-3 col-xl-4">
                <input disabled class="form-control" type="text" maxlength="16" name="deladr[oxaddress__oxstreetnr]" id="deladr_oxaddress__oxstreetnr" value="[{if isset( $deladr.oxaddress__oxstreetnr )}][{$deladr.oxaddress__oxstreetnr}][{else}][{$delivadr->oxaddress__oxstreetnr->value}][{/if}]" placeholder="[{oxmultilang ident="O3_STREETNO"}][{if $oView->isFieldRequired(oxaddress__oxstreetnr)}]*[{/if}]" value=""[{if $oView->isFieldRequired(oxaddress__oxstreetnr)}] required[{/if}]>
                <label for="deladr_oxaddress__oxstreetnr">[{oxmultilang ident="O3_STREETNO"}][{if $oView->isFieldRequired(oxaddress__oxstreetnr)}]*[{/if}]</label>
                [{if $oView->isFieldRequired(oxaddress__oxstreetnr)}]
                    <div class="invalid-feedback">
                        [{oxmultilang ident="DD_FORM_VALIDATION_STREETNO"}]
                    </div>
                [{/if}]
            </div>
        </div>

        <div class="row">
            <div class="form-floating mb-3 col-xl-4">
                <input disabled class="form-control" type="text" maxlength="50" name="deladr[oxaddress__oxzip]" id="deladr_oxaddress__oxzip" value="[{if isset( $deladr.oxaddress__oxzip )}][{$deladr.oxaddress__oxzip}][{else}][{$delivadr->oxaddress__oxzip->value}][{/if}]" placeholder="[{oxmultilang ident="O3_POSTAL_CODE"}][{if $oView->isFieldRequired(oxaddress__oxzip)}]*[{/if}]" autocomplete="shipping postal-code"[{if $oView->isFieldRequired(oxaddress__oxzip)}] required[{/if}]>
                <label for="deladr_oxaddress__oxzip">[{oxmultilang ident="O3_POSTAL_CODE"}][{if $oView->isFieldRequired(oxaddress__oxzip)}]*[{/if}]</label>
                [{if $oView->isFieldRequired(oxaddress__oxzip)}]
                    <div class="invalid-feedback">
                        [{oxmultilang ident="DD_FORM_VALIDATION_POSTAL_CODE"}]
                    </div>
                    [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxzip}]
                [{/if}]
            </div>
            <div class="form-floating mb-3 col-xl-8 ps-xl-0">
                <input disabled class="form-control" type="text" maxlength="255" name="deladr[oxaddress__oxcity]" id="deladr_oxaddress__oxcity" value="[{if isset( $deladr.oxaddress__oxcity )}][{$deladr.oxaddress__oxcity}][{else}][{$delivadr->oxaddress__oxcity->value}][{/if}]" placeholder="[{oxmultilang ident="O3_CITY"}][{if $oView->isFieldRequired(oxaddress__oxcity)}]*[{/if}]" autocomplete="shipping locality"[{if $oView->isFieldRequired(oxaddress__oxcity)}] required[{/if}]>
                <label for="deladr_oxaddress__oxcity">[{oxmultilang ident="O3_CITY"}][{if $oView->isFieldRequired(oxaddress__oxcity)}]*[{/if}]</label>
                [{if $oView->isFieldRequired(oxaddress__oxcity)}]
                    <div class="invalid-feedback">
                        [{oxmultilang ident="DD_FORM_VALIDATION_CITY"}]
                    </div>
                    [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxcity}]
                [{/if}]
            </div>
        </div>

        [{block name="form_user_shipping_country"}]
            <div class="form-floating mb-3">
                <select disabled class="form-select" id="delCountrySelect" name="deladr[oxaddress__oxcountryid]" autocomplete="shipping country"[{if $oView->isFieldRequired(oxaddress__oxcountryid)}] required[{/if}]>
                    <option value="">-</option>
                    [{assign var="blCountrySelected" value=false}]
                    [{foreach from=$oViewConf->getCountryList() item=country key=country_id}]
                        [{assign var="sCountrySelect" value=""}]
                        [{if !$blCountrySelected}]
                            [{if (isset($deladr.oxaddress__oxcountryid) && $deladr.oxaddress__oxcountryid == $country->oxcountry__oxid->value) ||
                        (!isset($deladr.oxaddress__oxcountryid) && ($delivadr->oxaddress__oxcountry->value == $country->oxcountry__oxtitle->value or
                        $delivadr->oxaddress__oxcountry->value == $country->oxcountry__oxid->value or
                        $delivadr->oxaddress__oxcountryid->value == $country->oxcountry__oxid->value))}]
                            [{assign var="blCountrySelected" value=true}]
                            [{assign var="sCountrySelect" value="selected"}]
                            [{/if}]
                        [{/if}]
                        <option value="[{$country->oxcountry__oxid->value}]" [{$sCountrySelect}]>[{$country->oxcountry__oxtitle->value}]</option>
                    [{/foreach}]
                </select>
                <label for="delCountrySelect">[{oxmultilang ident="COUNTRY"}][{if $oView->isFieldRequired(oxaddress__oxcountryid)}]*[{/if}]</label>
                [{if $oView->isFieldRequired(oxaddress__oxcountryid)}]
                    <div class="invalid-feedback">[{oxmultilang ident="DD_FORM_VALIDATION_COUNTRY"}]</div>
                    [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxcountryid}]
                [{/if}]
            </div>

            <div class="form-floating mb-3">
                [{include file="form/fieldset/state.tpl"
                countrySelectId="delCountrySelect"
                stateSelectName="deladr[oxaddress__oxstateid]"
                selectedStateIdPrim=$deladr.oxaddress__oxstateid
                selectedStateId=$delivadr->oxaddress__oxstateid->value
                class="form-select"
                disabled=true}]
                <label for="[{$countrySelectId}]">[{oxmultilang ident="DD_USER_LABEL_STATE"}]</label>
                <div class="invalid-feedback">[{oxmultilang ident="DD_FORM_VALIDATION_STATE"}]</div>
            </div>
        [{/block}]

        <div class="form-floating mb-3">
            <input disabled type="text" class="form-control" id="deladr_oxaddress__oxfon" name="deladr[oxaddress__oxfon]" maxlength="128" value="[{if isset( $deladr.oxaddress__oxfon )}][{$deladr.oxaddress__oxfon}][{else}][{$delivadr->oxaddress__oxfon->value}][{/if}]" autocomplete="shipping tel" placeholder="[{oxmultilang ident="PHONE"}][{if $oView->isFieldRequired(oxaddress__oxfon)}]*[{/if}]"[{if $oView->isFieldRequired(oxaddress__oxfon)}] required[{/if}]>
            <label for="deladr_oxaddress__oxfon">[{oxmultilang ident="PHONE"}][{if $oView->isFieldRequired(oxaddress__oxfon)}]*[{/if}]</label>
            [{if $oView->isFieldRequired(oxaddress__oxfon)}]
                <div class="invalid-feedback">[{oxmultilang ident="DD_FORM_VALIDATION_PHONE"}]</div>
                [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxfon}]
            [{/if}]
        </div>

        <div class="form-floating mb-3">
            <input disabled type="text" class="form-control" id="deladr_oxaddress__oxfax" name="deladr[oxaddress__oxfax]" maxlength="128" value="[{if isset( $deladr.oxaddress__oxfax )}][{$deladr.oxaddress__oxfax}][{else}][{$delivadr->oxaddress__oxfax->value}][{/if}]" placeholder="[{oxmultilang ident="FAX"}][{if $oView->isFieldRequired(oxaddress__oxfax)}]*[{/if}]"[{if $oView->isFieldRequired(oxaddress__oxfax)}] required[{/if}]>
            <label for="deladr_oxaddress__oxfax">[{oxmultilang ident="FAX"}][{if $oView->isFieldRequired(oxaddress__oxfax)}]*[{/if}]</label>
            [{if $oView->isFieldRequired(oxaddress__oxfax)}]
                <div class="invalid-feedback">[{oxmultilang ident="DD_FORM_VALIDATION_FAX"}]</div>
                [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxfax}]
            [{/if}]
        </div>

    </div>
[{/if}]