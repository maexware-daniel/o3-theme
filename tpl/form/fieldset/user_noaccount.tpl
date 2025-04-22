<div class="form-floating mb-3">
    [{block name="user_noaccount_email"}]
        <input type="email" class="form-control" id="userLoginName" name="lgn_usr" placeholder="[{oxmultilang ident="EMAIL_ADDRESS"}]*" value="[{$oView->getActiveUsername()}]" required>
        <label for="userLoginName">[{oxmultilang ident="EMAIL_ADDRESS"}]*</label>
        <div class="invalid-feedback">
            [{oxmultilang ident="DD_FORM_VALIDATION_VALIDEMAIL"}]
        </div>
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxusername}]
    [{/block}]
</div>

<div class="form-check mb-3">
    [{block name="user_noaccount_newsletter"}]
        <input type="hidden" name="blnewssubscribed" value="0">
        <input type="checkbox" class="form-check-input" id="newsletterCheckbox" name="blnewssubscribed" value="1" [{if $oView->isNewsSubscribed()}]checked[{/if}]>
        <label class="form-check-label" for="newsletterCheckbox">[{oxmultilang ident="NEWSLETTER_SUBSCRIPTION"}]</label>
        <div class="form-text">[{oxmultilang ident="MESSAGE_NEWSLETTER_SUBSCRIPTION"}]</div>
    [{/block}]
</div>