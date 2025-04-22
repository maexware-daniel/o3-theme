[{capture append="oxidBlock_content"}]

    <div class="row">

        <div class="col-12 col-md-4 col-lg-3 mb-5">
            [{include file="layout/sidebar.tpl" content="account" active_link="wishlist"}]
        </div>

        <div class="col-12 col-md-7 col-lg-8 offset-md-1">

            [{assign var="template_title" value="MY_GIFT_REGISTRY"|oxmultilangassign}]
            [{if !$oView->getWishListUsers() && $oView->getWishListSearchParam()}]
                [{assign var="_statusMessage" value="MESSAGE_SORRY_NO_GIFT_REGISTRY"|oxmultilangassign}]
                [{include file="message/error.tpl" statusMessage=$_statusMessage}]
            [{/if}]
            [{assign var="editval" value=$oView->getEnteredData()}]
            [{if $oView->isWishListEmailSent()}]
                [{assign var="_statusMessage" value="GIFT_REGISTRY_SENT_SUCCESSFULLY"|oxmultilangassign:$editval->rec_email}]
                [{include file="message/notice.tpl" statusMessage=$_statusMessage}]
            [{/if}]

            <h1 class="title-big">[{$oView->getTitle()}]</h1>
            <hr>

            [{include file="form/wishlist_search.tpl" searchClass="account_wishlist"}]

            [{if $oView->getWishList()}]
                [{include file="form/wishlist_publish.tpl"}]
                <hr>
                [{include file="form/wishlist_suggest.tpl"}]
            [{/if}]

            [{if $oView->getWishList()}]
                [{include file="widget/product/list.tpl" type="line" listId="wishlistProductList" title="" products=$oView->getWishProductList() removeFunction="towishlist" toBasketFunction="tobasket" owishid=$oxcmp_user->oxuser__oxid->value}]
            [{else}]
                <p class="alert alert-info">
                    [{oxmultilang ident="GIFT_REGISTRY_EMPTY"}]
                </p>
            [{/if}]
        </div>

    </div>
    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]

[{include file="layout/page.tpl"}]