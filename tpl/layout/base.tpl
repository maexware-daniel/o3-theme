[{* Important ! render page head and body to collect scripts and styles *}]
[{capture append="oxidBlock_pageHead"}]
    [{strip}]
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=[{$oView->getCharSet()}]">

        [{assign var=sPageTitle value=$oView->getPageTitle()}]
        <title>[{block name="head_title"}][{$sPageTitle}][{/block}]</title>

        [{block name="head_meta_robots"}]
            [{if $oView->noIndex() == 1}]
                <meta name="ROBOTS" content="NOINDEX, NOFOLLOW">
            [{elseif $oView->noIndex() == 2}]
                <meta name="ROBOTS" content="NOINDEX, FOLLOW">
            [{/if}]
        [{/block}]

        [{block name="head_meta_description"}]
            [{if $oView->getMetaDescription()}]
                <meta name="description" content="[{$oView->getMetaDescription()}]">
            [{/if}]
        [{/block}]

        [{block name="head_meta_keywords"}]
            [{if $oView->getMetaKeywords()}]
                <meta name="keywords" content="[{$oView->getMetaKeywords()}]">
            [{/if}]
        [{/block}]

        [{block name="head_meta_open_graph"}]
            <meta property="og:site_name" content="[{$oViewConf->getBaseDir()}]">
            <meta property="og:title" content="[{$sPageTitle}]">
            <meta property="og:description" content="[{$oView->getMetaDescription()}]">
            [{if $oViewConf->getActiveClassName() == 'details'}]
                <meta property="og:type" content="product">
                <meta property="og:image" content="[{$oView->getActPicture()}]">
                <meta property="og:url" content="[{$oView->getCanonicalUrl()}]">
            [{else}]
                <meta property="og:type" content="website">
                <meta property="og:image" content="[{$oViewConf->getImageUrl('basket.png')}]">
                <meta property="og:url" content="[{$oViewConf->getCurrentHomeDir()}]">
            [{/if}]
        [{/block}]

        [{block name="head_meta_schema"}]
            <meta itemprop="copyrightHolder" content="[{$oxcmp_shop->oxshops__oxname->value}]">
            <meta itemprop="image" content="[{$oViewConf->getImageUrl()}][{$oViewConf->getViewThemeParam('sLogoFile')}]">
        [{/block}]

        [{assign var="canonical_url" value=$oView->getCanonicalUrl()}]
        [{block name="head_link_canonical"}]
            [{if $canonical_url}]
                <link rel="canonical" href="[{$canonical_url}]">
            [{/if}]
        [{/block}]

        [{block name="head_link_hreflang"}]
            [{if $oView->isLanguageLoaded()}]
                [{assign var="oConfig" value=$oViewConf->getConfig()}]
                [{foreach from=$oxcmp_lang item=_lng}]
                    [{if $_lng->id == $oConfig->getConfigParam('sDefaultLang')}]
                        <link rel="alternate" hreflang="x-default" href="[{$_lng->link}]"/>
                    [{/if}]
                    <link rel="alternate" hreflang="[{$_lng->abbr}]" href="[{$_lng->link|oxaddparams:$oView->getDynUrlParams()}]"/>
                [{/foreach}]
            [{/if}]
        [{/block}]

        [{block name="head_link_favicon"}]
            [{assign var="sFaviconFile"    value=$oViewConf->getViewThemeParam('sFaviconIcoFile')}]
            [{assign var="sFavicon16File"  value=$oViewConf->getViewThemeParam('sFaviconSvgFile')}]
            [{assign var="sFavicon32File"  value=$oViewConf->getViewThemeParam('sFaviconAppleFile')}]

            <link rel="icon" href="[{$oViewConf->getResourceUrl()}]favicon/favicon.ico" sizes="32x32">
            <link rel="icon" href="[{$oViewConf->getResourceUrl()}]favicon/icon.svg" type="image/svg+xml">
            <link rel="apple-touch-icon" href="[{$oViewConf->getResourceUrl()}]favicon/apple-touch-icon.png"> [{* 180×180 *}]
            <link rel="manifest" href="[{$oViewConf->getResourceUrl()}]favicon/manifest.webmanifest">
        [{/block}]

        [{block name="base_style"}]
            [{if $oxcmp_shop->oxshops__oxproductive->value}]
                [{oxstyle include="css/main.min.css"}]
            [{else}]
                [{oxstyle include="css/main.css"}]
            [{/if}]
        [{/block}]

        [{block name="base_fonts"}]
        [{/block}]

        [{assign var='rsslinks' value=$oView->getRssLinks()}]
        [{block name="head_link_rss"}]
            [{if $rsslinks}]
                [{foreach from=$rsslinks item='rssentry'}]
                    <link rel="alternate" type="application/rss+xml" title="[{$rssentry.title|strip_tags}]" href="[{$rssentry.link}]">
                [{/foreach}]
            [{/if}]
        [{/block}]

        [{block name="head_css"}]
            [{foreach from=$oxidBlock_head item="_block"}]
                [{$_block}]
            [{/foreach}]
        [{/block}]
    [{/strip}]
[{/capture}]

[{assign var="blIsCheckout" value=$oView->getIsOrderStep()}]

<!DOCTYPE html>
<html lang="[{$oView->getActiveLangAbbr()}]" itemscope="itemscope" itemtype="https://schema.org/WebPage" [{block name="head_html_namespace"}][{/block}]>
    <!--suppress HtmlRequiredTitleElement -->
    <head>
        [{foreach from=$oxidBlock_pageHead item="_block"}]
            [{$_block}]
        [{/foreach}]
        [{oxstyle}]
        [{if $oViewConf->getViewThemeParam('blPrimaryColor') || $oViewConf->getViewThemeParam('blSecondaryColor') || $oViewConf->getViewThemeParam('blFooterColor')}]
            <style>
                :root {
                [{if $oViewConf->getViewThemeParam('blPrimaryColor')}]
                    --bs-primary:[{$oViewConf->getViewThemeParam('blPrimaryColor')}];
                [{/if}]
                [{if $oViewConf->getViewThemeParam('blSecondaryColor')}]
                    --bs-secondary: [{$oViewConf->getViewThemeParam('blSecondaryColor')}];
                [{/if}]
                [{if $oViewConf->getViewThemeParam('blFooterColor')}]
                    --footer-bg: [{$oViewConf->getViewThemeParam('blFooterColor')}];
                [{/if}]
                }
            </style>
        [{/if}]
    </head>

    <body class="cl-[{$oView->getClassName()}][{if $blIsCheckout}] is-checkout[{/if}][{if $oxcmp_user && $oxcmp_user->oxuser__oxpassword->value}] is-logged[{/if}]">

    [{block name="theme_svg_icons"}][{/block}]

    [{foreach from=$oxidBlock_pageBody item="_block"}]
        [{$_block}]
    [{/foreach}]

    [{if $oViewConf->getViewThemeParam('sShowMode')}]
        <div class="mode__[{$oViewConf->getViewThemeParam('sShowModePosition')}][{if $oxcmp_shop->oxshops__oxproductive->value}] is-prod[{else}] is-dev[{/if}]">
            [{if $oxcmp_shop->oxshops__oxproductive->value}]
                ProductiveMode
            [{else}]
                DevMode
            [{/if}]
        </div>
    [{/if}]

    [{block name="base_js"}]
        [{if $oxcmp_shop->oxshops__oxproductive->value}]
            [{oxscript include="js/main.min.js" priority=1}]
        [{else}]
            [{oxscript include="js/main.js" priority=1}]
        [{/if}]
    [{/block}]

    [{if $oViewConf->getViewThemeParam('activateJquery')}]
        [{oxscript include="js/jquery.min.js" priority=1}]
    [{/if}]

    [{oxscript}]

    [{oxid_include_dynamic file="widget/dynscript.tpl"}]

    [{foreach from=$oxidBlock_pageScript item="_block"}]
        [{$_block}]
    [{/foreach}]
    </body>
</html>
