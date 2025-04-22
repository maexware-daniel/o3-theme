<button class="btn btn-toggle d-md-none" type="button" data-bs-toggle="collapse" data-bs-target="#account__menu" aria-controls="account__menu" aria-expanded="false">
    [{oxmultilang ident="DD_ROLES_BEMAIN_UIROOTHEADER"}]
    <svg width="19" height="10" viewBox="0 0 19 10" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M1 1L9.5 9L18 1" stroke="#112211" stroke-linecap="round" stroke-linejoin="round"/>
    </svg>
</button>

<nav class="account__menu collapse d-md-flex" id="account__menu">

    [{block name="account_menu"}]
        
        <a class="[{if $active_link == "password"}] active[{/if}]" href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_password"}]" title="[{oxmultilang ident="CHANGE_PASSWORD"}]">[{oxmultilang ident="CHANGE_PASSWORD"}]</a>
        
        <a class="[{if $active_link == "newsletter"}] active[{/if}]" href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_newsletter"}]" title="[{oxmultilang ident="NEWSLETTER_SETTINGS"}]">[{oxmultilang ident="NEWSLETTER_SETTINGS"}]</a>
        
        <a class="[{if $active_link == "billship"}] active[{/if}]" href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_user"}]" title="[{oxmultilang ident="BILLING_SHIPPING_SETTINGS"}]">[{oxmultilang ident="BILLING_SHIPPING_SETTINGS"}]</a>
        
        <a class="[{if $active_link == "orderhistory"}] active[{/if}]" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_order"}]" title="[{oxmultilang ident="ORDER_HISTORY"}]">[{oxmultilang ident="ORDER_HISTORY"}]</a>
        
        [{if $oViewConf->getShowCompareList()}]            
            <a class="[{if $active_link == "compare"}] active[{/if}]" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=compare"}]" title="[{oxmultilang ident="MY_PRODUCT_COMPARISON"}]">[{oxmultilang ident="MY_PRODUCT_COMPARISON"}][{if $oView->getCompareItemCount() > 0}] ([{$oView->getCompareItemCount()}])[{/if}]</a>
        [{/if}]
        
        <a class="[{if $active_link == "noticelist"}] active[{/if}]" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_noticelist"}]" title="[{oxmultilang ident="MY_WISH_LIST"}]">[{oxmultilang ident="MY_WISH_LIST"}][{if $oxcmp_user && $oxcmp_user->getNoticeListArtCnt() > 0}] ([{$oxcmp_user->getNoticeListArtCnt()}])[{/if}]</a>
        
        [{if $oViewConf->getShowWishlist()}]            
            <a class="[{if $active_link == "wishlist"}] active[{/if}]" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_wishlist"}]" title="[{oxmultilang ident="MY_GIFT_REGISTRY"}]">[{oxmultilang ident="MY_GIFT_REGISTRY"}][{if $oxcmp_user && $oxcmp_user->getWishListArtCnt() > 0}] ([{$oxcmp_user->getWishListArtCnt()}])[{/if}]</a>
        [{/if}]
    
        [{if $oViewConf->getShowListmania()}]
            <a class="[{if $active_link == "recommendationlist"}] active[{/if}]" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_recommlist"}]" title="[{oxmultilang ident="MY_LISTMANIA"}]">[{oxmultilang ident="MY_LISTMANIA"}]</a>
        [{/if}]
    
        [{if $oView->isEnabledDownloadableFiles()}]
            <a class="[{if $active_link == "downloads"}] active[{/if}]" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_downloads"}]" title="[{oxmultilang ident="MY_DOWNLOADS"}]">[{oxmultilang ident="MY_DOWNLOADS"}]</a>
        [{/if}]
    
        [{if $oView->isUserAllowedToManageOwnReviews()}]            
            <a class="[{if $active_link == "reviewlist"}] active[{/if}]" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_reviewlist"}]" title="[{oxmultilang ident="MY_REVIEWS"}]">[{oxmultilang ident="MY_REVIEWS"}][{if $oView->getReviewAndRatingItemsCount() > 0}] ([{$oView->getReviewAndRatingItemsCount()}])[{/if}]</a>
        [{/if}]
        
        <a class="account__menu-logout btn btn-outline-primary btn-lg" href="[{$oViewConf->getLogoutLink()}]">
            [{oxmultilang ident="LOGOUT"}]
        </a>
        
    [{/block}]

</nav>
