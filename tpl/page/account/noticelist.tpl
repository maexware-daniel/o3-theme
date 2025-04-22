[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value="MY_WISH_LIST"|oxmultilangassign}]
    [{oxscript include="js/widget/remove-from-notice.js" priority=10}]

    <div class="row">

        <div class="col-12 col-md-4 col-lg-3 mb-5">
            [{include file="layout/sidebar.tpl" content="account" active_link="noticelist"}]
        </div>

        <div class="col-12 col-md-7 col-lg-8 offset-md-1">

            <h1 class="title-big">[{oxmultilang ident="MY_WISH_LIST"}]</h1>
            <hr>

            [{if $oView->getNoticeProductList()}]
                [{include file="widget/product/list.tpl" listId="noticelistProductList" products=$oView->getNoticeProductList() removeFunction="tonoticelist" owishid=$oxcmp_user->oxuser__oxid->value}]
            [{else}]
                <p class="alert alert-info">[{oxmultilang ident="WISH_LIST_EMPTY"}]</p>
            [{/if}]
        </div>
    </div>
    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]

[{include file="layout/page.tpl"}]