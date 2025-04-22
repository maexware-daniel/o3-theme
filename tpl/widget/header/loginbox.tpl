[{assign var="bIsError" value=0}]
[{capture name="loginErrors"}]
    [{foreach from=$Errors.loginBoxErrors item=oEr key=key}]
        <p id="errorBadLogin" class="alert alert-danger">[{$oEr->getOxMessage()}]</p>
        [{assign var="bIsError" value=1}]
    [{/foreach}]
[{/capture}]
[{if !$oxcmp_user->oxuser__oxpassword->value}]
    <form class="form" id="login" name="login" action="[{$oViewConf->getSslSelfLink()}]" method="post">
        <div id="loginBox" class="loginBox" [{if $bIsError}]style="display: block;"[{/if}]>
            [{$oViewConf->getHiddenSid()}]
            [{$oViewConf->getNavFormParams()}]
            <input type="hidden" name="fnc" value="login_noredirect">
            <input type="hidden" name="cl" value="[{$oViewConf->getTopActiveClassName()}]">
            [{if $oViewConf->getTopActiveClassName() eq "content"}]
                <input type="hidden" name="oxcid" value="[{$oViewConf->getContentId()}]">
            [{/if}]
            <input type="hidden" name="pgNr" value="[{$oView->getActPage()}]">
            <input type="hidden" name="CustomError" value="loginBoxErrors">
            [{if $oViewConf->getActArticleId()}]
                <input type="hidden" name="anid" value="[{$oViewConf->getActArticleId()}]">
            [{/if}]

            <div class="form-group">
                <input id="loginEmail" type="email" name="lgn_usr" autocomplete="email" value="" class="form-control" placeholder="[{oxmultilang ident="EMAIL_ADDRESS"}]">
            </div>

            <div class="form-group">
                <div class="input-group">
                    <input id="loginPasword" type="password" name="lgn_pwd" autocomplete="current-password" class="form-control" value="" placeholder="[{oxmultilang ident="PASSWORD"}]">
                </div>
            </div>

            [{if $oViewConf->isFunctionalityEnabled( "blShowRememberMe" )}]
                <div class="checkbox">
                    <label>
                        <input type="checkbox" class="checkbox" value="1" name="lgn_cook" id="remember"> [{oxmultilang ident="REMEMBER_ME"}]
                    </label>
                </div>
            [{/if}]

            <a class="forgotPasswordOpener btn btn-tertiary" href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=forgotpwd"}]" title="[{oxmultilang ident="FORGOT_PASSWORD"}]">[{oxmultilang ident="FORGOT_PASSWORD"}]</a>

            <button type="submit" class="btn btn-primary">[{oxmultilang ident="LOGIN"}]</button>

            [{block name="thirdparty_login"}][{/block}]

        </div>
    </form>
[{/if}]
