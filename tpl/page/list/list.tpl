[{assign var="actCategory" value=$oView->getActiveCategory()}]

[{if $oxcmp_shop->oxshops__oxproductive->value}]
    [{oxscript include="js/widget/filter.min.js" priority=10}]
[{else}]
    [{oxscript include="js/widget/filter.js" priority=10}]
[{/if}]

[{capture append="oxidBlock_sidebar"}]
    [{assign var="listType" value=$oView->getListType()}]
    [{if $listType=='manufacturer' || $listType=='vendor'}]
        [{if $actCategory && $actCategory->getIconUrl()}]
        <div class="box">
            <h3>
                [{if $listType=='manufacturer'}]
                    [{oxmultilang ident="BRAND"}]
                [{elseif $listType=='vendor'}]
                    [{oxmultilang ident="VENDOR"}]
                [{/if}]
            </h3>
            <img loading="lazy" src="[{$actCategory->getIconUrl()}]" alt="[{$actCategory->getTitle()}]">
        </div>
        [{/if}]
    [{/if}]
[{/capture}]

[{capture append="oxidBlock_content"}]
    [{block name="page_list_listhead"}]
        [{if $actCategory->oxcategories__oxthumb->value && $actCategory->getThumbUrl()}]
            <img class="alist__image" src="[{$actCategory->getThumbUrl()}]" alt="[{$actCategory->oxcategories__oxtitle->value}]">
        [{/if}]

        [{assign var='rsslinks' value=$oView->getRssLinks()}]
        <h1 class="title-big">
            [{$oView->getTitle()}][{if $oView->getArticleList()}]<span>[{$oView->getArticleList()|count}] [{oxmultilang ident="O3_ARTICLE"}]</span>[{/if}]
            [{if $rsslinks.activeCategory}]
                <a class="rss" id="rssActiveCategory" aria-label="RSS Current Category" href="[{$rsslinks.activeCategory.link}]" title="[{$rsslinks.activeCategory.title}]" target="_blank">
                    <i class="fas fa-rss"></i>
                </a>
            [{/if}]
        </h1>

        [{assign var="oPageNavigation" value=$oView->getPageNavigation()}]
        [{if $actCategory->oxcategories__oxlongdesc->value && $oPageNavigation->actPage == 1}]
            <div id="catLongDescLocator" class="categoryDescription">[{oxeval var=$actCategory->oxcategories__oxlongdesc}]</div>
        [{/if}]

        <div class="alist__orga[{if !$oView->hasVisibleSubCats()}] empty[{/if}]">
            [{if $oView->hasVisibleSubCats()}]
                <div class="alist__orga-subcats">
                    [{foreach from=$oView->getSubCatList() item=category name=MoreSubCat}]

                        [{if $category->getContentCats()}]
                            [{foreach from=$category->getContentCats() item=ocont name=MoreCms}]
                                <a class="btn" href="[{$ocont->getLink()}]">[{$ocont->oxcontents__oxtitle->value}]</a>
                            [{/foreach}]
                        [{/if}]

                        [{if $category->getIsVisible() && $oView->getClassName() != "manufacturerlist"}]
                            <a class="btn" href="[{$category->getLink()}]">[{$category->oxcategories__oxtitle->value}]</a>
                        [{elseif $oView->getClassName() == "manufacturerlist"}]
                            <a class="start__manufacturer-box g-col-6 g-col-sm-4 g-col-lg-2" href="[{$category->getLink()}]" title="[{oxmultilang ident="VIEW_ALL_PRODUCTS"}]">
                                <img src="[{$category->getIconUrl()}]" alt="[{$category->oxcategories__oxtitle->value}]">
                            </a>
                        [{/if}]

                    [{/foreach}]
                </div>
            [{/if}]

            [{if $oView->getAttributes()}]
                <button type="button" class="btn btn-primary btn-lg d-lg-none w-100" data-bs-toggle="offcanvas" data-bs-target="#offcanvas__filter" aria-controls="offcanvas__filter">
                    <svg width="17" height="21" viewBox="0 0 17 21" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M1 4.5V1H15.5V4.5L10 9.5V19L6 16V9.5L1 4.5Z" stroke="white" stroke-width="1.5"/>
                    </svg>
                    [{oxmultilang ident="DD_LISTLOCATOR_FILTER_ATTRIBUTES"}]
                </button>
            [{/if}]

            <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvas__filter">
                <div class="offcanvas-header">
                    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body alist__filter">
                    [{include file="widget/locator/attributes.tpl" attributes=$oView->getAttributes() offcanvas=true}]
                </div>
            </div>

            [{if $oView->getArticleList()}]
                [{block name="page_list_upperlocator"}]
                    [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigationLimitedTop() listDisplayType=true  sort=true}]
                [{/block}]
            [{/if}]
        </div>

    [{/block}]

    [{block name="page_list_listbody"}]
        [{if $oView->getArticleList()}]

            <hr class="d-none d-lg-block">

            [{block name="page_list_productlist"}]
                <div class="row">
                    [{if $oView->getAttributes()}]
                        <div class="alist__filter col-3">
                            [{include file="layout/sidebar.tpl" content="attributes"}]
                        </div>
                    [{/if}]
                    [{include file="widget/product/list.tpl" type=$oView->getListDisplayType() listId="productList" products=$oView->getArticleList()}]
                </div>
            [{/block}]

            [{block name="page_list_bottomlocator"}]
                [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigationLimitedBottom() place="bottom" attributes=$oView->getAttributes()}]
            [{/block}]

        [{/if}]
    [{/block}]
    [{insert name="oxid_tracker"}]
[{/capture}]
[{include file="layout/page.tpl" tree_path=$oView->getTreePath()}]
