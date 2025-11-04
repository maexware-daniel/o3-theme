[{capture append="oxidBlock_content"}]

    [{assign var="oConfig" value=$oViewConf->getConfig()}]
    [{assign var='rsslinks' value=$oView->getRssLinks()}]

    [{if $oView->getBanners() && !empty($oView->getBanners())}]
        [{include file="widget/promoslider.tpl"}]
    [{/if}]

    [{block name="start_welcome_text"}]

        [{assign var="o3benefit1" value=0}]
        [{oxifcontent ident="o3benefit1" object="oCont"}]
            [{assign var="o3benefit1" value=1}]
        [{/oxifcontent}]

        [{assign var="o3benefit2" value=0}]
        [{oxifcontent ident="o3benefit2" object="oCont"}]
            [{assign var="o3benefit2" value=1}]
        [{/oxifcontent}]

        [{assign var="o3benefit3" value=0}]
        [{oxifcontent ident="o3benefit3" object="oCont"}]
            [{assign var="o3benefit3" value=1}]
        [{/oxifcontent}]

        [{assign var="o3benefit4" value=0}]
        [{oxifcontent ident="o3benefit1" object="oCont"}]
            [{assign var="o3benefit4" value=1}]
        [{/oxifcontent}]

        [{if $o3benefit1 || $o3benefit2 || $o3benefit3 || $o3benefit4}]
            <div class="start__benefits">
                [{oxifcontent ident="o3benefit1" object="oCont"}]
                    <div class="start__benefits-box">
                        [{$oCont->oxcontents__oxcontent->value}]
                    </div>
                [{/oxifcontent}]
                [{oxifcontent ident="o3benefit2" object="oCont"}]
                    <div class="start__benefits-box">
                        [{$oCont->oxcontents__oxcontent->value}]
                    </div>
                [{/oxifcontent}]
                [{oxifcontent ident="o3benefit3" object="oCont"}]
                    <div class="start__benefits-box">
                        [{$oCont->oxcontents__oxcontent->value}]
                    </div>
                [{/oxifcontent}]
                [{oxifcontent ident="o3benefit4" object="oCont"}]
                    <div class="start__benefits-box">
                        [{$oCont->oxcontents__oxcontent->value}]
                    </div>
                [{/oxifcontent}]
            </div>
        [{/if}]

    [{/block}]

    [{assign var="fixedBanner" value=$oView->getBanners()}]

    [{if $fixedBanner.fixedBannerSmall1 || $fixedBanner.fixedBannerSmall2 || $fixedBanner.fixedBannerSmall3}]
        [{include file="widget/fixedbanner.tpl" fixedBanner=$fixedBanner}]
    [{/if}]

    [{assign var="oTopArticles" value=$oView->getTop5ArticleList()}]

    [{block name="start_bargain_articles"}]
        [{assign var="oBargainArticles" value=$oView->getBargainArticleList()}]
        [{if $oBargainArticles && $oBargainArticles->count()}]
            <div class="component__productslider">
                <h2 class="title-big">[{oxmultilang ident="START_BARGAIN_HEADER"}]</h2>
                <hr>
                [{include file="widget/product/list_splide.tpl" listId="bargainItems" products=$oBargainArticles rsslink=$rsslinks.bargainArticles rssId="rssBargainProducts" showMainLink=true}]
            </div>
        [{/if}]
    [{/block}]

    [{if $fixedBanner.fixedBannerBig}]
        [{if $fixedBanner.fixedBannerBig->getBannerLink()}]
            <a class="start__fixedbanner d-block" href="[{$fixedBanner.fixedBannerBig->getBannerLink()}]">
                <img class="img-fluid" src="[{$fixedBanner.fixedBannerBig->getBannerPictureUrl()}]" alt="[{$fixedBanner.fixedBannerBig->oxactions__oxtitle->value}]">
            </a>
        [{else}]
            <img class="start__fixedbanner img-fluid" src="[{$fixedBanner.fixedBannerBig->getBannerPictureUrl()}]" alt="[{$fixedBanner.fixedBannerBig->oxactions__oxtitle->value}]">
        [{/if}]
    [{/if}]

    [{block name="start_newest_articles"}]
        [{assign var="oNewestArticles" value=$oView->getNewestArticles()}]
        [{if $oNewestArticles && $oNewestArticles->count()}]
            <div class="component__productslider">
                <h2 class="title-big">[{oxmultilang ident="START_NEWEST_HEADER"}]</h2>
                <hr>
                [{include file="widget/product/list_splide.tpl" listId="newItems" products=$oNewestArticles rsslink=$rsslinks.newestArticles rssId="rssNewestProducts" showMainLink=true}]
            </div>
        [{/if}]
    [{/block}]

    [{block name="start_top_articles"}]
        [{if $oTopArticles && $oTopArticles->count()}]
            <div class="component__productslider">
                <h2 class="title-big">[{oxmultilang ident="START_TOP_PRODUCTS_HEADER"}]</h2>
                <hr>
                [{include file="widget/product/list_splide.tpl" listId="topBox" products=$oTopArticles rsslink=$rsslinks.topArticles rssId="rssTopProducts" showMainLink=true}]
            </div>
        [{/if}]
    [{/block}]

    [{block name="start_manufacturer_slider"}]
        [{if $oViewConf->getViewThemeParam('bl_showManufacturer')}]
            [{include file="widget/manufacturers.tpl"}]
        [{/if}]
    [{/block}]

    [{insert name="oxid_tracker"}]
[{/capture}]
[{include file="layout/page.tpl"}]
