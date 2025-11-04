[{if $oxcmp_shop->oxshops__oxproductive->value}]
    [{oxscript include="js/widget/validate.min.js" priority=10}]
[{else}]
    [{oxscript include="js/widget/validate.js" priority=10}]
[{/if}]

<form action="[{$oViewConf->getSelfActionLink()}]" name="changepassword" method="post" class="needs-validation" novalidate>
    [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]

    <div class="d-none">
        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="fnc" value="changePassword">
        <input type="hidden" name="cl" value="account_password">
        <input type="hidden" name="CustomError" value='user'>
        <input type="hidden" id="passwordLength" value="[{$oViewConf->getPasswordLength()}]">
    </div>

    <div class="form-floating mb-3">
        <input type="password" id="passwordOld" name="password_old" class="form-control" placeholder="[{oxmultilang ident="OLD_PASSWORD"}]" required autocomplete="current-password">
        <label for="passwordOld">[{oxmultilang ident="OLD_PASSWORD"}]</label>
        <div class="invalid-feedback">
            [{oxmultilang ident="O3_FORM_VALIDATION_OLD_PASSWORD"}]
        </div>
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxpassword}]
    </div>

    [{block name="user_account_password"}]
        <div class="form-floating mb-3">
            <input id="userPassword" type="password" name="password_new" class="form-control" placeholder="[{oxmultilang ident="NEW_PASSWORD"}]" required pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{[{$oViewConf->getPasswordLength()}],}$" autocomplete="new-password">
            <label for="userPassword">[{oxmultilang ident="NEW_PASSWORD"}]</label>
            <div class="invalid-feedback">
                [{oxmultilang ident="O3_FORM_VALIDATION_PASSWORD"}]
            </div>
            <div class="input-info">
                [{oxmultilang ident="O3_FORM_VALIDATION_PASSWORD_LENGTH" args=$oViewConf->getPasswordLength()}][{oxmultilang ident="O3_FORM_VALIDATION_PASSWORD_LETTERS"}]
            </div>
            [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxpassword}]
        </div>
    [{/block}]

    <div class="form-floating mb-3">
        <input id="userPasswordConfirm" type="password" name="password_new_confirm" class="form-control" placeholder="[{oxmultilang ident="CONFIRM_PASSWORD"}]" required pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{[{$oViewConf->getPasswordLength()}],}$" autocomplete="new-password">
        <label for="userPasswordConfirm">[{oxmultilang ident="CONFIRM_PASSWORD"}]</label>
        <div class="invalid-feedback">
            [{oxmultilang ident="O3_FORM_VALIDATION_NEW_PASSWORD"}]
        </div>
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxpassword}]
    </div>

    <button id="savePass" type="submit" class="btn btn-primary" role="button">[{oxmultilang ident="SAVE"}]</button>

</form>
