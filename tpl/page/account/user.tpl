[{capture append="oxidBlock_content"}]
    <div class="row">
        <div class="col-12 col-md-4 col-lg-3 mb-5">
            [{include file="layout/sidebar.tpl" content="account" active_link="billship"}]
        </div>

        [{block name="account_user_form"}]
            <div class="col-12 col-md-7 col-lg-8 offset-md-1">
                <h1 class="title-big">[{$oView->getTitle()}]</h1>
                <hr>
                [{include file="form/user.tpl"}]
            </div>
        [{/block}]
    </div>
    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]

[{include file="layout/page.tpl"}]