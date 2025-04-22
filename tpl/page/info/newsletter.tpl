[{capture append="oxidBlock_content"}]

    [{if $oView->getNewsletterStatus() == 4 || !$oView->getNewsletterStatus()}]
        <h1 class="title-big">[{oxmultilang ident="STAY_INFORMED"}]</h1>

        <hr>

        [{oxifcontent ident="oxnewstlerinfo" object="oCont"}]
            [{$oCont->oxcontents__oxcontent->value}]
        [{/oxifcontent}]

        [{include file="form/newsletter.tpl"}]

    [{elseif $oView->getNewsletterStatus() == 1}]

        <h1 class="title-big">[{oxmultilang ident="MESSAGE_THANKYOU_FOR_SUBSCRIBING_NEWSLETTERS"}]</h1>

        <p>[{oxmultilang ident="MESSAGE_SENT_CONFIRMATION_EMAIL"}]</p>

    [{elseif $oView->getNewsletterStatus() == 2}]

        <h1 class="title-big">[{oxmultilang ident="MESSAGE_NEWSLETTER_CONGRATULATIONS"}]</h1>

        <p>[{oxmultilang ident="MESSAGE_NEWSLETTER_SUBSCRIPTION_ACTIVATED"}]</p>

    [{elseif $oView->getNewsletterStatus() == 3}]

        <h1 class="title-big">[{oxmultilang ident="SUCCESS"}]</h1>

        <p>[{oxmultilang ident="MESSAGE_NEWSLETTER_SUBSCRIPTION_CANCELED"}]</p>

    [{/if}]

    [{insert name="oxid_tracker"}]
[{/capture}]

[{include file="layout/page.tpl"}]