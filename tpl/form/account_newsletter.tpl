[{assign var="oConfig" value=$oViewConf->getConfig()}]

<form action="[{$oViewConf->getSelfActionLink()}]" name="newsletter" method="post">
    <div class="d-none">
        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="fnc" value="subscribe">
        <input type="hidden" name="cl" value="account_newsletter">
    </div>

    <div class="form-floating mb-3">
        <select name="status" id="account_newsletter__status" class="form-select">
            <option value="1"[{if $oView->isNewsletter()}] selected[{/if}]>[{oxmultilang ident="YES"}]</option>
            <option value="0"[{if !$oView->isNewsletter()}] selected[{/if}]>[{oxmultilang ident="NO"}]</option>
        </select>
        <label for="account_newsletter__status">[{oxmultilang ident="NEWSLETTER_SUBSCRIPTION"}]</label>
    </div>

    [{if $oConfig->getConfigParam('blOrderOptInEmail') && $oView->getSubscriptionStatus() == 1}]
        <p>
            [{oxmultilang ident="O3_NEWSLETTER_OPT_IN_DESCRIPTION"}]
        </p>
    [{/if}]

    <button type="submit" class="btn btn-primary">[{oxmultilang ident="SAVE"}]</button>
</form>