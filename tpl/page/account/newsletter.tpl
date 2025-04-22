[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value="NEWSLETTER_SETTINGS"|oxmultilangassign}]

    <div class="row">

        <div class="col-12 col-md-4 col-lg-3 mb-5">
            [{include file="layout/sidebar.tpl" content="account" active_link="newsletter"}]
        </div>

        <div class="col-12 col-md-7 col-lg-8 offset-md-1">

            <h1 class="title-big">[{oxmultilang ident="NEWSLETTER_SETTINGS"}]</h1>
            <hr>

            [{if $oView->getSubscriptionStatus() != 0}]
                [{if $oView->getSubscriptionStatus() == 1}]
                    <div class="alert alert-success">[{oxmultilang ident="MESSAGE_NEWSLETTER_SUBSCRIPTION_SUCCESS"}]</div>
                [{else}]
                    <div class="alert alert-success">[{oxmultilang ident="MESSAGE_NEWSLETTER_SUBSCRIPTION_CANCELED"}]</div>
                [{/if}]
            [{/if}]

            [{include file="form/account_newsletter.tpl"}]

        </div>

    </div>

    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]

[{include file="layout/page.tpl"}]