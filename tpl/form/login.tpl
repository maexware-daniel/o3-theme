[{oxscript include="js/widget/validate.js" priority=10}]

<form name="login" action="[{$oViewConf->getSslSelfLink()}]" method="post" class="needs-validation col-12 col-md-6 col-lg-5 mb-4" novalidate>

    <h2 class="title-big">[{oxmultilang ident="ALREADY_CUSTOMER"}]</h2>

    <div class="d-none">
        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="fnc" value="login_noredirect">
        <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
    </div>

    [{block name="checkout_options_login_text"}][{/block}]

    [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]

    <div class="form-floating mb-4">
        <input type="email" class="form-control" id="lgn_usr" name="lgn_usr" placeholder="[{oxmultilang ident="EMAIL_ADDRESS"}]" autocomplete="username" required>
        <label for="lgn_usr">[{oxmultilang ident="EMAIL_ADDRESS"}]</label>
        <div class="invalid-feedback">
            [{oxmultilang ident="DD_FORM_VALIDATION_VALIDEMAIL"}]
        </div>
    </div>

    <div class="form-floating mb-3">
        <input type="password" class="form-control" id="lgn_pwd" name="lgn_pwd" placeholder="[{oxmultilang ident="PASSWORD"}]" autocomplete="current-password" required>
        <label for="lgn_pwd">[{oxmultilang ident="PASSWORD"}]</label>
        <div class="invalid-feedback">
            [{oxmultilang ident="ERROR_MESSAGE_INPUT_EMPTYPASS"}]
        </div>
    </div>

    <div class="d-flex justify-content-between">
        <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=forgotpwd"}]" class="account__login-forget">[{oxmultilang ident="FORGOT_PASSWORD"}]</a>
    </div>

    <button type="submit" class="btn btn-primary submitButton">[{oxmultilang ident="LOGIN"}]</button>

</form>

