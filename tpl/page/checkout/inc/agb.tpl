[{if !$hideButtons}]

    [{if !$oView->isActive('PsLogin')}]
        [{if $oView->isConfirmAGBActive()}]
            [{oxifcontent ident="oxrighttocancellegend" object="oContent"}]
                <h3 class="title-small">
                    [{$oContent->oxcontents__oxtitle->value}]
                </h3>
            [{/oxifcontent}]
        [{else}]
            [{oxifcontent ident="oxrighttocancellegend2" object="oContent"}]
                <h3 class="title-small">
                    [{$oContent->oxcontents__oxtitle->value}]
                </h3>
            [{/oxifcontent}]
        [{/if}]
    [{/if}]

    [{block name="checkout_order_agb_inner"}]
        [{if !$oView->isActive('PsLogin')}]
            [{if $oView->isConfirmAGBActive()}]
                [{oxifcontent ident="oxrighttocancellegend" object="oContent"}]
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="ord_agb" value="1" id="checkAgbTop">
                        <label class="form-check-label" for="checkAgbTop">
                            [{$oContent->oxcontents__oxcontent->value}]
                        </label>
                    </div>
                [{/oxifcontent}]
            [{else}]
                [{oxifcontent ident="oxrighttocancellegend2" object="oContent"}]
                    [{$oContent->oxcontents__oxcontent->value}]
                [{/oxifcontent}]
            [{/if}]
        [{/if}]

        [{if $oViewConf->isFunctionalityEnabled('blEnableIntangibleProdAgreement') }]
            [{assign var="oExplanationMarks" value=$oView->getBasketContentMarkGenerator() }]
            [{if $oxcmp_basket->hasArticlesWithDownloadableAgreement() }]
                [{oxifcontent ident="oxdownloadableproductsagreement" object="oContent"}]
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="oxdownloadableproductsagreement" value="1" id="oxdownloadableproductsagreement">
                        <label class="form-check-label" for="oxdownloadableproductsagreement">
                            [{$oExplanationMarks->getMark('downloadable')}] [{$oContent->oxcontents__oxcontent->value}]
                        </label>
                    </div>
                [{/oxifcontent}]
            [{/if}]
            [{if $oxcmp_basket->hasArticlesWithIntangibleAgreement() }]
                [{oxifcontent ident="oxserviceproductsagreement" object="oContent"}]
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="oxserviceproductsagreement" value="1" id="oxserviceproductsagreement">
                        <label class="form-check-label" for="oxserviceproductsagreement">
                            [{$oExplanationMarks->getMark('intangible')}] [{$oContent->oxcontents__oxcontent->value}]
                        </label>
                    </div>
                [{/oxifcontent}]
            [{/if}]
        [{/if}]

        [{if $oViewConf->isFunctionalityEnabled("blShowTSInternationalFeesMessage")}]
            [{oxifcontent ident="oxtsinternationalfees" object="oTSIFContent"}]
                <hr/>[{$oTSIFContent->oxcontents__oxcontent->value}]
            [{/oxifcontent}]
        [{/if}]

        [{if $payment->oxpayments__oxid->value eq "oxidcashondel" && $oViewConf->isFunctionalityEnabled("blShowTSCODMessage")}]
            [{oxifcontent ident="oxtscodmessage" object="oTSCODContent"}]
                <hr/>[{$oTSCODContent->oxcontents__oxcontent->value}]
            [{/oxifcontent}]
        [{/if}]
    [{/block}]

[{/if}]