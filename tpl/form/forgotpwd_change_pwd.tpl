[{oxscript include="js/widget/validate.js" priority=10}]

<form action="[{$oViewConf->getSelfActionLink()}]" name="forgotpwd" method="post" class="needs-validation" novalidate>
    [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
    <div class="d-none">
        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="fnc" value="updatePassword">
        <input type="hidden" name="uid" value="[{$oView->getUpdateId()}]">
        <input type="hidden" name="cl" value="forgotpwd">
        <input type="hidden" id="passwordLength" value="[{$oViewConf->getPasswordLength()}]">
    </div>

    <div class="form-floating mb-3">
        [{block name="user_account_password"}]
            <input id="userPassword" type="password" name="password_new" placeholder="[{oxmultilang ident="NEW_PASSWORD"}]*" class="form-control" required pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{[{$oViewConf->getPasswordLength()}],}$" autocomplete="new-password">
            <label for="userPassword">[{oxmultilang ident="NEW_PASSWORD"}]</label>
            <div class="invalid-feedback">
                [{oxmultilang ident="O3_FORM_VALIDATION_PASSWORD"}]
            </div>
            <div class="input-info">
                [{oxmultilang ident="O3_FORM_VALIDATION_PASSWORD_LENGTH" args=$oViewConf->getPasswordLength()}][{oxmultilang ident="O3_FORM_VALIDATION_PASSWORD_LETTERS"}]
            </div>
        [{/block}]
    </div>

    <div class="form-floating mb-3">
        <input id="userPasswordConfirm" type="password" name="password_new_confirm" class="form-control" placeholder="[{oxmultilang ident="CONFIRM_PASSWORD"}]*" required pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{[{$oViewConf->getPasswordLength()}],}$" autocomplete="new-password">
        <label for="userPasswordConfirm">[{oxmultilang ident="CONFIRM_PASSWORD"}]</label>
        <div class="invalid-feedback">
            [{oxmultilang ident="DD_FORM_VALIDATION_PASSWORDAGAIN"}]
        </div>
    </div>

    <button class="btn btn-primary submitButton" type="submit" name="save" value="[{oxmultilang ident="CHANGE_PASSWORD"}]">[{oxmultilang ident="CHANGE_PASSWORD"}]</button>

</form>
