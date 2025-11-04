[{if $oxcmp_shop->oxshops__oxproductive->value}]
    [{oxscript include="js/widget/validate.min.js" priority=10}]
[{else}]
    [{oxscript include="js/widget/validate.js" priority=10}]
[{/if}]

[{if $oView->getAccountDeletionStatus() == true}]
    [{assign var="statusMessage" value="DD_DELETE_MY_ACCOUNT_SUCCESS"|oxmultilangassign}]
    [{include file="message/success.tpl" statusMessage=$statusMessage}]
[{/if}]
<div class="row">
    <form name="login" action="[{$oViewConf->getSslSelfLink()}]" method="post" class="needs-validation col-12 col-md-6 col-lg-5 mb-5" novalidate>
        <div class="d-none">
            [{$oViewConf->getHiddenSid()}]
            [{$oViewConf->getNavFormParams()}]
            <input type="hidden" name="fnc" value="login_noredirect">
            <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
            <input type="hidden" name="tpl" value="[{$oViewConf->getActTplName()}]">
            <input type="hidden" name="oxloadid" value="[{$oViewConf->getActContentLoadId()}]">
            [{if $oView->getArticleId()}]
                <input type="hidden" name="aid" value="[{$oView->getArticleId()}]">
            [{/if}]
            [{if $oView->getProduct()}]
                [{assign var="product" value=$oView->getProduct()}]
                <input type="hidden" name="anid" value="[{$product->oxarticles__oxnid->value}]">
            [{/if}]
        </div>

        <h2 class="title-big">[{oxmultilang ident="LOGIN"}]</h2>

        <div class="form-floating mb-4">
            <input type="email" class="form-control" id="loginUser" name="lgn_usr" placeholder="[{oxmultilang ident="EMAIL"}]" required autocomplete="username">
            <label for="loginUser">[{oxmultilang ident="EMAIL"}]</label>
            <div class="invalid-feedback">
                [{oxmultilang ident="DD_FORM_VALIDATION_VALIDEMAIL"}]
            </div>
        </div>

        <div class="form-floating mb-3">
            <input type="password" class="form-control" id="loginPwd" name="lgn_pwd" placeholder="[{oxmultilang ident="PASSWORD"}]" required autocomplete="current-password">
            <label for="loginPwd">[{oxmultilang ident="PASSWORD"}]</label>
            <div class="invalid-feedback">
                [{oxmultilang ident="ERROR_MESSAGE_INPUT_EMPTYPASS"}]
            </div>
        </div>

        <div class="d-flex justify-content-between">
            [{if $oView->showRememberMe()}]
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" name="lgn_cook" value="1" id="remember-me">
                    <label class="form-check-label" for="remember-me">
                        [{oxmultilang ident="KEEP_LOGGED_IN"}]
                    </label>
                </div>
            [{/if}]

            <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=forgotpwd"}]" class="account__login-forget">[{oxmultilang ident="FORGOT_PASSWORD"}]</a>
        </div>

        <button type="submit" class="btn btn-primary">[{oxmultilang ident="LOGIN"}]</button>
    </form>

    <div class="col-12 col-md-5 offset-md-1 offset-lg-2">
        <h2 class="title-big">[{oxmultilang ident="OPEN_ACCOUNT"}]</h2>
        <p>[{oxmultilang ident="DD_LOGIN_ACCOUNT_PANEL_CREATE_BODY"}]</p>
        <a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=register"}]" class="btn btn-primary" role="button">[{oxmultilang ident="OPEN_ACCOUNT"}]</a>
    </div>
</div>