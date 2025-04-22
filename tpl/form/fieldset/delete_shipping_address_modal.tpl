[{block name="delete_shipping_address_modal"}]
    [{if $oxcmp_user}]
        [{assign var="userAddresses" value=$oxcmp_user->getUserAddresses()}]
    [{/if}]
    [{foreach from=$userAddresses item=shippingAddress name="shippingAdresses"}]
    [{assign var="shippingAddressNumber" value=$smarty.foreach.shippingAdresses.iteration}]
        <div class="modal fade" id="delete_shipping_address_[{$shippingAddressNumber}]" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        [{block name="delete_shipping_address_modal_header"}]
                            <div class="modal-title fs-5">[{oxmultilang ident="DD_DELETE_SHIPPING_ADDRESS"}]?</div>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        [{/block}]
                    </div>
                    <div class="modal-body">
                        [{block name="delete_shipping_address_modal_contents"}]
                            <div class="row">
                                <div class="col-md-12">
                                    <form name="delete_shipping_address_modal_form_[{$shippingAddressNumber}]"
                                          action="[{$oViewConf->getSelfActionLink()}]"
                                          method="post">
                                        <div class="d-none">
                                            [{$oViewConf->getHiddenSid()}]
                                            <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
                                            <input type="hidden" name="fnc" value="deleteShippingAddress">
                                            <input type="hidden" name="oxaddressid"
                                                   value="[{$shippingAddress->oxaddress__oxid->value}]">
                                        </div>
                                        [{include file="widget/address/shipping_address.tpl" delivadr=$shippingAddress}]
                                    </form>
                                </div>
                            </div>
                        [{/block}]
                    </div>
                    <div class="modal-footer">
                        [{block name="delete_shipping_address_modal_footer"}]
                            <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal" aria-label="Close">[{oxmultilang ident="DD_DELETE_MY_ACCOUNT_CANCEL"}]</button>
                            <button type="button"
                                    class="btn btn-danger"
                                    onclick="window.delete_shipping_address_modal_form_[{$shippingAddressNumber}].submit();return false;">
                                [{oxmultilang ident="DD_DELETE"}]
                            </button>
                        [{/block}]
                    </div>
                </div>
            </div>
        </div>
    [{/foreach}]
[{/block}]



