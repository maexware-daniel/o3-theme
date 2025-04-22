<div class="form-floating mb-3">
    <input class="form-control" type="email" name="invadr[oxuser__oxusername]" value="[{if isset( $invadr.oxuser__oxusername )}][{$invadr.oxuser__oxusername}][{else}][{$oxcmp_user->oxuser__oxusername->value}][{/if}]" placeholder="[{oxmultilang ident="EMAIL_ADDRESS"}]" autocomplete="username">
    <label for="email">[{oxmultilang ident="EMAIL_ADDRESS"}]</label>
    <div class="invalid-feedback">
        [{oxmultilang ident="DD_FORM_VALIDATION_VALIDEMAIL"}]
    </div>
</div>

[{*
<div class="form-group[{if $aErrors.oxuser__oxusername}] oxInValid[{/if}]">
    <label class="req control-label col-lg-3">[{oxmultilang ident="EMAIL_ADDRESS"}]</label>
    <div class="col-lg-9">
        <input class="js-oxValidate js-oxValidate_notEmpty js-oxValidate_email oxValidate_enterPass oxValidate_enterPassTarget[oxValidate_pwd] form-control" type="text" name="invadr[oxuser__oxusername]" value="[{if isset( $invadr.oxuser__oxusername )}][{$invadr.oxuser__oxusername}][{else}][{$oxcmp_user->oxuser__oxusername->value}][{/if}]" size="37" autocomplete="username">
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxusername}]
        <div class="help-block"></div>
    </div>
</div>
*}]

[{if $oxcmp_user->oxuser__oxpassword->value}]
    <div class="form-floating mb-3"[{if !$aErrors.oxuser__oxpassword}] style="display:none;"[{/if}]>
        <input class="form-control" type="password" name="user_password" placeholder="[{oxmultilang ident="PASSWORD"}]" autocomplete="new-password">
        <label for="password">[{oxmultilang ident="PASSWORD"}]</label>
        <div class="invalid-feedback">
            [{oxmultilang ident="ERROR_MESSAGE_INPUT_EMPTYPASS"}]
        </div>
    </div>
[{/if}]

[{*
[{if $oxcmp_user->oxuser__oxpassword->value}]
    <div class="oxValidate_pwd form-group[{if $aErrors.oxuser__oxpassword}] oxInValid[{/if}]" [{if !$aErrors.oxuser__oxpassword}]style="display:none;"[{/if}]>
        <label class="req control-label col-lg-3">[{oxmultilang ident="PASSWORD"}]</label>
        <div class="col-lg-9">
            <input class="js-oxValidate js-oxValidate_notEmpty form-control" type="password" size="37" name="user_password" autocomplete="new-password">
            [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxpassword}]
            <div class="help-block"></div>
        </div>
    </div>
[{/if}]
*}]
