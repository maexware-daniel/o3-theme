[{if $blOrderRemark}]
    <div class="user__message mb-5">
        <h3 class="title-small">
            [{oxmultilang ident="MESSAGE"}]
        </h3>
        <div class="form-floating mb-3">
            <textarea class="form-control" name="order_remark" placeholder="[{oxmultilang ident="HERE_YOU_CAN_ENETER_MESSAGE"}]">[{$oView->getOrderRemark()}]</textarea>
            <label for="orderRemark">[{oxmultilang ident="HERE_YOU_CAN_ENETER_MESSAGE"}]</label>
            <div class="invalid-feedback">
                [{oxmultilang ident="DD_FORM_VALIDATION_MESSAGE"}]
            </div>
        </div>
    </div>
[{/if}]