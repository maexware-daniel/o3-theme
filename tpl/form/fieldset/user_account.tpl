<div class="form-floating mb-3">
    [{block name="user_account_username"}]
        <input type="email" class="form-control" id="userLoginName" name="lgn_usr" value="[{$oView->getActiveUsername()}]" placeholder="[{oxmultilang ident="EMAIL_ADDRESS"}]*" autocomplete="username" required>
        <label for="userLoginName">[{oxmultilang ident="EMAIL_ADDRESS"}]*</label>
        <div class="invalid-feedback">
            [{oxmultilang ident="DD_FORM_VALIDATION_VALIDEMAIL"}]
        </div>
    [{/block}]
</div>

<div class="mb-3">
    [{block name="user_account_password"}]
        <input type="hidden" id="passwordLength" data-js="password-length" value="[{$oViewConf->getPasswordLength()}]">

        <div class="input-group has-validation">
            <div class="form-floating flex-grow-1">
                <input id="userPassword" class="form-control border-end-0" type="password" name="lgn_pwd" placeholder="[{oxmultilang ident="PASSWORD"}]*" value="[{$lgn_pwd}]" required autocomplete="new-password">
                <label for="userPassword">[{oxmultilang ident="PASSWORD"}]*</label>
            </div>
            <button class="btn btn-input border-start-0" type="button" data-js="toggle-password" data-target="userPassword" aria-label="Passwort anzeigen" aria-pressed="false">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#DBDBDB" viewBox="0 0 16 16">
                    <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0"/>
                    <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7"/>
                </svg>
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#DBDBDB" viewBox="0 0 16 16">
                    <path d="m10.79 12.912-1.614-1.615a3.5 3.5 0 0 1-4.474-4.474l-2.06-2.06C.938 6.278 0 8 0 8s3 5.5 8 5.5a7 7 0 0 0 2.79-.588M5.21 3.088A7 7 0 0 1 8 2.5c5 0 8 5.5 8 5.5s-.939 1.721-2.641 3.238l-2.062-2.062a3.5 3.5 0 0 0-4.474-4.474z"/>
                    <path d="M5.525 7.646a2.5 2.5 0 0 0 2.829 2.829zm4.95.708-2.829-2.83a2.5 2.5 0 0 1 2.829 2.829zm3.171 6-12-12 .708-.708 12 12z"/>
                </svg>
            </button>
            <div class="invalid-feedback">
                [{oxmultilang ident="O3_FORM_VALIDATION_PASSWORD"}]
            </div>
        </div>

        [{include file="form/fieldset/password_validation.tpl"}]
    [{/block}]
</div>

<div class="mb-3">
    [{block name="user_account_confirmpwd"}]
        <div class="input-group has-validation">
            <div class="form-floating flex-grow-1">
                <input id="userPasswordConfirm" class="form-control border-end-0" type="password" name="lgn_pwd2" value="[{$lgn_pwd2}]" placeholder="[{oxmultilang ident="CONFIRM_PASSWORD"}]*" required autocomplete="new-password">
                <label for="userPasswordConfirm">[{oxmultilang ident="CONFIRM_PASSWORD"}]*</label>
            </div>
            <button class="btn btn-input border-start-0" type="button" data-js="toggle-password" data-target="userPasswordConfirm" aria-label="Passwort anzeigen" aria-pressed="false">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#DBDBDB" viewBox="0 0 16 16">
                    <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0"/>
                    <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7"/>
                </svg>
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#DBDBDB" viewBox="0 0 16 16">
                    <path d="m10.79 12.912-1.614-1.615a3.5 3.5 0 0 1-4.474-4.474l-2.06-2.06C.938 6.278 0 8 0 8s3 5.5 8 5.5a7 7 0 0 0 2.79-.588M5.21 3.088A7 7 0 0 1 8 2.5c5 0 8 5.5 8 5.5s-.939 1.721-2.641 3.238l-2.062-2.062a3.5 3.5 0 0 0-4.474-4.474z"/>
                    <path d="M5.525 7.646a2.5 2.5 0 0 0 2.829 2.829zm4.95.708-2.829-2.83a2.5 2.5 0 0 1 2.829 2.829zm3.171 6-12-12 .708-.708 12 12z"/>
                </svg>
            </button>
            <div class="invalid-feedback">
                [{oxmultilang ident="O3_FORM_VALIDATION_PASSWORD_CONFIRM"}]
            </div>
        </div>
    [{/block}]
</div>

<div class="form-check mb-3">
    [{block name="user_account_newsletter"}]
        <input type="hidden" name="blnewssubscribed" value="0">
        <input type="checkbox" class="form-check-input" id="newsletterCheckbox" name="blnewssubscribed" value="1" [{if $oView->isNewsSubscribed()}]checked[{/if}]>
        <label class="form-check-label" for="newsletterCheckbox">[{oxmultilang ident="NEWSLETTER_SUBSCRIPTION"}]</label>
        <div class="form-text">[{oxmultilang ident="MESSAGE_NEWSLETTER_SUBSCRIPTION"}]</div>
    [{/block}]
</div>
