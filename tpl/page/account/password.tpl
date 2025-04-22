[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value="CHANGE_PASSWORD"|oxmultilangassign}]

    <div class="row">

        <div class="col-12 col-md-4 col-lg-3 mb-5">
            [{include file="layout/sidebar.tpl" content="account" active_link="password"}]
        </div>

        <div class="col-12 col-md-7 col-lg-8 offset-md-1">

            <h1 class="title-big">[{oxmultilang ident="CHANGE_PASSWORD"}]</h1>
            <hr>

            [{if $oView->isPasswordChanged()}]
                <div class="alert alert-success">
                    [{oxmultilang ident="MESSAGE_PASSWORD_CHANGED"}]
                </div>
            [{/if}]
            [{if $Errors|is_array && $Errors.user|is_array && !empty($Errors.user)}]
                <div class="alert alert-danger">
                    [{foreach from=$Errors.user item=oEr key=key}]
                        [{$oEr->getOxMessage()}]
                    [{/foreach}]
                </div>
            [{/if}]

            [{include file="form/user_password.tpl"}]

        </div>

    </div>

    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]

[{include file="layout/page.tpl"}]
