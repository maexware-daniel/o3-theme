[{if $blSubscribeNews}]
    [{block name="user_billing_newsletter"}]
        <div class="user__newsletter mb-5">
            <h3 class="title-small">
                [{oxmultilang ident="NEWSLETTER"}]
            </h3>
            <input type="hidden" name="blnewssubscribed" value="0">
            <div class="form-check">
                <input class="form-check-input" type="checkbox" name="blnewssubscribed" value="1" id="subscribeNewsletter"[{if $oView->isNewsSubscribed()}] checked[{/if}]>
                <label class="form-check-label" for="subscribeNewsletter">
                    [{oxmultilang ident="NEWSLETTER_SUBSCRIPTION"}]
                </label>
            </div>
            <div>[{oxmultilang ident="MESSAGE_NEWSLETTER_SUBSCRIPTION"}]</div>
        </div>
        [{*
        <input type="hidden" name="blnewssubscribed" value="0">
        <div class="checkbox">
            <label for="subscribeNewsletter">
                <input type="checkbox" name="blnewssubscribed" id="subscribeNewsletter" [{if $oView->isNewsSubscribed()}]checked[{/if}] value="1"> [{oxmultilang ident="NEWSLETTER_SUBSCRIPTION"}]
            </label>
        </div>
        <span class="help-block">[{oxmultilang ident="MESSAGE_NEWSLETTER_SUBSCRIPTION"}]</span>
        *}]
    [{/block}]
[{/if}]