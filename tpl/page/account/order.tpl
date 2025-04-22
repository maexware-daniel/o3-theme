[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value="ORDER_HISTORY"|oxmultilangassign}]

    <div class="row">

        <div class="col-12 col-md-4 col-lg-3 mb-5">
            [{include file="layout/sidebar.tpl" content="account" active_link="orderhistory"}]
        </div>

        [{assign var=oOrders value=$oView->getOrderList()}]
        [{block name="account_order_history"}]
            <div class="col-12 col-md-7 col-lg-8 offset-md-1">

                <h1 class="title-big">[{oxmultilang ident="ORDER_HISTORY"}]</h1>

                [{if $oOrders && !empty($oOrders)}]
                    [{assign var=oArticleList value=$oView->getOrderArticleList()}]

                    [{foreach from=$oOrders item=order}]
                        <div class="account_order">

                            [{if $order->oxorder__oxstorno->value}]
                                <div class="account_order__status-danger">
                                    [{oxmultilang ident="ORDER_IS_CANCELED"}]
                                </div>
                            [{elseif $order->oxorder__oxsenddate->value !="-"}]
                                <div class="account_order__status-success">
                                    [{oxmultilang ident="SHIPPED"}]
                                </div>
                            [{else}]
                                <div class="account_order__status-warning">
                                    [{oxmultilang ident="NOT_SHIPPED_YET"}]
                                </div>
                            [{/if}]

                            <div class="account_order__ordernumber">
                                <span>#[{$order->oxorder__oxordernr->value}]</span> - [{$order->oxorder__oxorderdate->value|date_format:"%d.%m.%Y"}]
                            </div>

                            <div class="account_order__sum">
                                [{oxprice price=$order->oxorder__oxtotalordersum->value currency=$currency}]
                            </div>

                            <button class="btn" type="button" data-bs-toggle="collapse" data-bs-target="#accOrderNo_[{$order->oxorder__oxordernr->value}]" aria-controls="accOrderNo_[{$order->oxorder__oxordernr->value}]" aria-expanded="false">
                                [{oxmultilang ident="MORE"}]
                            </button>
                        </div>

                        <div class="account_order__details collapse" id="accOrderNo_[{$order->oxorder__oxordernr->value}]">
                            <div class="col-12 col-lg-6 p-4">

                                <div class="title-small mb-3">[{oxmultilang ident="O3_ORDER_INFO"}]</div>
                                [{*
                                <div class="account_order__details-payment">
                                    [{oxmultilang ident="PAYMENT_METHOD"}]
                                    [{$order->oxorder__oxpaymenttype->value}]
                                </div>
                                *}]

                                [{assign var="oDelSet" value=$order->getDelSet()}]
                                <div class="account_order__details-delivery mb-3">
                                    [{oxmultilang ident="SHIPPING_CARRIER" suffix="COLON"}]
                                    [{$oDelSet->oxdeliveryset__oxtitle->value}]
                                </div>

                                <div class="account_order__details-address">
                                    [{oxmultilang ident="SHIPMENT_TO" suffix="COLON"}]

                                    <address class="mb-3">
                                        [{if $order->oxorder__oxdelfname->value &&
                                            $order->oxorder__oxdellname->value &&
                                            $order->oxorder__oxdelstreet->value &&
                                            $order->oxorder__oxdelstreetnr->value &&
                                            $order->oxorder__oxdelzip->value &&
                                            $order->oxorder__oxdelcity->value
                                        }]
                                            [{$order->oxorder__oxdelcompany->value}][{if $order->oxorder__oxdelcompany->value}]<br>[{/if}]
                                            [{$order->oxorder__oxdelfname->value}] [{$order->oxorder__oxdellname->value}]<br>
                                            [{$order->oxorder__oxdelstreet->value}] [{$order->oxorder__oxdelstreetnr->value}]<br>
                                            [{$order->oxorder__oxdelzip->value}] [{$order->oxorder__oxdelcity->value}]<br>
                                            [{$order->oxorder__oxdelcountry->value}]
                                        [{else}]
                                            [{$order->oxorder__oxbillcompany->value}][{if $order->oxorder__oxbillcompany->value}]<br>[{/if}]
                                            [{$order->oxorder__oxbillfname->value}] [{$order->oxorder__oxbilllname->value}]<br>
                                            [{$order->oxorder__oxbillstreet->value}] [{$order->oxorder__oxbillstreetnr->value}]<br>
                                            [{$order->oxorder__oxbillzip->value}] [{$order->oxorder__oxbillcity->value}]<br>
                                            [{$order->oxorder__oxbillcountry->value}]
                                        [{/if}]
                                    </address>
                                </div>

                                [{if $order->getShipmentTrackingUrl()}]
                                    <div class="account_order__details-tracking">
                                        [{oxmultilang ident="TRACKING_ID" suffix="COLON"}]
                                        <a href="[{$order->getShipmentTrackingUrl()}]">[{$order->oxorder__oxtrackcode->value}]</a>
                                    </div>
                                [{/if}]
                            </div>

                            <div class="col-12 col-lg-6 p-4">
                                [{block name="account_order_history_cart_items"}]

                                    <div class="title-small">[{oxmultilang ident="O3_ARTICLE"}]</div>

                                    [{foreach from=$order->getOrderArticles(true) item=orderitem name=testOrderItem}]
                                        [{assign var=sArticleId value=$orderitem->oxorderarticles__oxartid->value}]
                                        [{assign var=oArticle value=$oArticleList[$sArticleId]}]

                                        <div class="account_order__details-article">
                                            <img src="[{$oArticle->getThumbnailUrl()}]" alt="[{$orderitem->oxorderarticles__oxtitle->value}]">
                                            <div>
                                                [{$orderitem->oxorderarticles__oxamount->value}] x
                                                [{if $oArticle->oxarticles__oxid->value && $oArticle->isVisible()}]
                                                    <a id="accOrderLink_[{$order->oxorder__oxordernr->value}]_[{$smarty.foreach.testOrderItem.iteration}]" href="[{$oArticle->getLink()}]">
                                                [{/if}]
                                                [{$orderitem->oxorderarticles__oxtitle->value}] [{$orderitem->oxorderarticles__oxselvariant->value}] <span class="amount"></span>
                                                [{if $oArticle->oxarticles__oxid->value && $oArticle->isVisible()}]
                                                    </a>
                                                [{/if}]

                                                [{foreach key=sVar from=$orderitem->getPersParams() item=aParam}]
                                                [{if $aParam}]
                                                    <br />[{oxmultilang ident="DETAILS"}]: [{$aParam}]
                                                [{/if}]
                                                [{/foreach}]
                                            </div>
                                            <div class="flex-grow-1 text-end fw-bold text-nowrap">
                                                [{oxprice price=$oArticle->oxarticles__oxprice->value currency=$currency}]
                                            </div>
                                        </div>
                                    [{/foreach}]

                                [{/block}]
                            </div>
                        </div>
                    [{/foreach}]

                    [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigation() place="bottom"}]
                [{else}]
                    <hr>
                    <p class="alert alert-info">[{oxmultilang ident="ORDER_EMPTY_HISTORY"}]</p>
                [{/if}]
            </div>
        [{/block}]
    </div>
    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]

[{include file="layout/page.tpl"}]