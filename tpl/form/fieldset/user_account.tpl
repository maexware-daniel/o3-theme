<div class="form-floating mb-3">
    [{block name="user_account_username"}]
        <input type="email" class="form-control" id="userLoginName" name="lgn_usr" value="[{$oView->getActiveUsername()}]" placeholder="[{oxmultilang ident="EMAIL_ADDRESS"}]*" autocomplete="username" required>
        <label for="userLoginName">[{oxmultilang ident="EMAIL_ADDRESS"}]*</label>
        <div class="invalid-feedback">
            [{oxmultilang ident="DD_FORM_VALIDATION_VALIDEMAIL"}]
        </div>
    [{/block}]
</div>

<div class="form-floating mb-3">
    [{block name="user_account_password"}]
        <input type="hidden" id="passwordLength" value="[{$oViewConf->getPasswordLength()}]">
        <input id="userPassword" class="form-control" type="password" name="lgn_pwd" placeholder="[{oxmultilang ident="PASSWORD"}]*" value="[{$lgn_pwd}]" required pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{[{$oViewConf->getPasswordLength()}],}$" autocomplete="new-password">
        <label for="userPassword">[{oxmultilang ident="PASSWORD"}]*</label>
        <div class="invalid-feedback">
            [{oxmultilang ident="O3_FORM_VALIDATION_PASSWORD"}]
        </div>
        <div class="input-info">
            [{oxmultilang ident="O3_FORM_VALIDATION_PASSWORD_LENGTH" args=$oViewConf->getPasswordLength()}][{oxmultilang ident="O3_FORM_VALIDATION_PASSWORD_LETTERS"}]
        </div>
    [{/block}]
</div>

<div class="form-floating mb-3">
    [{block name="user_account_confirmpwd"}]
        <input id="userPasswordConfirm" class="form-control" type="password" name="lgn_pwd2" value="[{$lgn_pwd2}]" placeholder="[{oxmultilang ident="CONFIRM_PASSWORD"}]*" required pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{[{$oViewConf->getPasswordLength()}],}$" autocomplete="new-password">
        <label for="userPasswordConfirm">[{oxmultilang ident="CONFIRM_PASSWORD"}]*</label>
        <div class="invalid-feedback">
            [{oxmultilang ident="O3_FORM_VALIDATION_PASSWORD_CONFIRM"}]
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
