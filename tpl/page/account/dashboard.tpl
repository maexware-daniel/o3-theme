[{assign var="template_title" value="MY_ACCOUNT"|oxmultilangassign}]
[{capture append="oxidBlock_content"}]

    [{if $oView->getAccountDeletionStatus() === false}]
        [{assign var="statusMessage" value="DD_DELETE_MY_ACCOUNT_ERROR"|oxmultilangassign}]
        [{include file="message/error.tpl" statusMessage=$statusMessage}]
    [{/if}]

    <div class="row">

        <div class="col-12 col-md-4 col-lg-3 mb-5">
            [{include file="layout/sidebar.tpl" content="account"}]
        </div>

        <div class="col-12 col-md-7 col-lg-8 offset-md-1">

            <h1 class="title-big">[{oxmultilang ident="MY_ACCOUNT"}]</h1>

            <div class="row">
                <div class="col-12 col-md-6">
                    [{block name="account_dashboard_col1"}]
                    <div class="card mb-4">
                        <div class="card-header card-header d-flex align-center justify-content-between">
                            <a id="linkAccountPassword" href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_password"}]">[{oxmultilang ident="CHANGE_PASSWORD"}]</a>
                            <a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_password"}]" class="btn btn-edit">
                                [{oxmultilang ident="CHANGE"}]
                            </a>
                        </div>
                        <div class="card-body">[{oxmultilang ident="CHANGE_PASSWORD"}]</div>
                    </div>
                    <div class="card mb-4">
                        <div class="card-header card-header d-flex align-center justify-content-between">
                            <a id="linkAccountNewsletter" href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_newsletter"}]">[{oxmultilang ident="NEWSLETTER_SETTINGS"}]</a>
                            <a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_newsletter"}]" class="btn btn-edit">
                                [{oxmultilang ident="CHANGE"}]
                            </a>
                        </div>
                        <div class="card-body">[{oxmultilang ident="NEWSLETTER_SUBSCRIBE_CANCEL"}]</div>
                    </div>
                    <div class="card mb-4">
                        <div class="card-header card-header d-flex align-center justify-content-between">
                            <a id="linkAccountBillship" href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_user"}]">[{oxmultilang ident="BILLING_SHIPPING_SETTINGS"}]</a>
                            <a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_user"}]" class="btn btn-edit">
                                [{oxmultilang ident="CHANGE"}]
                            </a>
                        </div>
                        <div class="card-body">[{oxmultilang ident="UPDATE_YOUR_BILLING_SHIPPING_SETTINGS"}]</div>
                    </div>
                    <div class="card mb-4">
                        <div class="card-header card-header d-flex align-center justify-content-between">
                            <a id="linkAccountOrder" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_order"}]">[{oxmultilang ident="ORDER_HISTORY"}]</a>
                            <a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_order"}]" class="btn btn-edit">
                                [{oxmultilang ident="CHANGE"}]
                            </a>
                        </div>
                        <div class="card-body">[{oxmultilang ident="ORDERS"}] [{$oView->getOrderCnt()}]</div>
                    </div>
                    [{if $oView->isEnabledDownloadableFiles()}]
                    <div class="card mb-4">
                        <div class="card-header card-header d-flex align-center justify-content-between">
                            <a id="linkAccountDownloads" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_downloads"}]">[{oxmultilang ident="MY_DOWNLOADS"}]</a>
                            <a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_downloads"}]" class="btn btn-edit">
                                [{oxmultilang ident="CHANGE"}]
                            </a>
                        </div>
                        <div class="card-body">[{oxmultilang ident="MY_DOWNLOADS_DESC"}]</div>
                    </div>
                    [{/if}]
                    [{/block}]
                </div>
                <div class="col-12 col-md-6">
                    [{block name="account_dashboard_col2"}]
                    <div class="card mb-4">
                        <div class="card-header card-header d-flex align-center justify-content-between">
                            <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_noticelist"}]">[{oxmultilang ident="MY_WISH_LIST"}]</a>
                            <a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_noticelist"}]" class="btn btn-edit">
                                [{oxmultilang ident="CHANGE"}]
                            </a>
                        </div>
                        <div class="card-body">[{oxmultilang ident="PRODUCT"}] [{if $oxcmp_user}][{$oxcmp_user->getNoticeListArtCnt()}][{else}]0[{/if}]</div>
                    </div>
                    [{if $oViewConf->getShowWishlist()}]
                    <div class="card mb-4">
                        <div class="card-header card-header d-flex align-center justify-content-between">
                            <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_wishlist"}]">[{oxmultilang ident="MY_GIFT_REGISTRY"}]</a>
                            <a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_wishlist"}]" class="btn btn-edit">
                                [{oxmultilang ident="CHANGE"}]
                            </a>
                        </div>
                        <div class="card-body">[{oxmultilang ident="PRODUCT"}] [{if $oxcmp_user}][{$oxcmp_user->getWishListArtCnt()}][{else}]0[{/if}]</div>
                    </div>
                    [{/if}]
                    [{if $oViewConf->getShowCompareList()}]
                    <div class="card mb-4">
                        <div class="card-header card-header d-flex align-center justify-content-between">
                            <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=compare"}]">[{oxmultilang ident="MY_PRODUCT_COMPARISON"}]</a>
                            <a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=compare"}]" class="btn btn-edit">
                                [{oxmultilang ident="CHANGE"}]
                            </a>
                        </div>
                        <div class="card-body">[{oxmultilang ident="PRODUCT"}] [{if $oView->getCompareItemsCnt()}][{$oView->getCompareItemsCnt()}][{else}]0[{/if}]</div>
                    </div>
                    [{/if}]
                    [{if $oViewConf->getShowListmania()}]
                    <div class="card mb-4">
                        <div class="card-header card-header d-flex align-center justify-content-between">
                            <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_recommlist"}]">[{oxmultilang ident="MY_LISTMANIA"}]</a>
                            <a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_recommlist"}]" class="btn btn-edit">
                                [{oxmultilang ident="CHANGE"}]
                            </a>
                        </div>
                        <div class="card-body">[{oxmultilang ident="LISTS"}] [{if $oxcmp_user->getRecommListsCount()}][{$oxcmp_user->getRecommListsCount()}][{else}]0[{/if}]</div>
                    </div>
                    [{/if}]
                        [{if $oView->isUserAllowedToManageOwnReviews()}]
                            <div class="card mb-4">
                                <div class="card-header card-header d-flex align-center justify-content-between">
                                    <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_reviewlist"}]">[{oxmultilang ident="MY_REVIEWS"}]</a>
                                    <a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_reviewlist"}]" class="btn btn-edit">
                                        [{oxmultilang ident="CHANGE"}]
                                    </a>
                                </div>
                                <div class="card-body">[{oxmultilang ident="MY_REVIEWS"}] [{if $oView->getReviewAndRatingItemsCount()}][{$oView->getReviewAndRatingItemsCount()}][{else}]0[{/if}]</div>
                            </div>
                        [{/if}]
                    [{/block}]
                </div>
            </div>

            [{block name="account_dashboard_delete_my_account"}]
                [{if $oView->isUserAllowedToDeleteOwnAccount()}]
                    <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#delete_my_account_confirmation" aria-controls="delete_my_account_confirmation">
                        [{oxmultilang ident="DD_DELETE_MY_ACCOUNT"}]
                    </button>
                    [{include file="page/account/delete_my_account_confirmation.tpl"}]
                [{/if}]
            [{/block}]

        </div>
    </div>

    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]

[{include file="layout/page.tpl"}]
