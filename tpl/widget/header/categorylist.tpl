[{block name="dd_widget_header_categorylist"}]
    [{if $oxcmp_categories}]
        [{assign var="homeSelected" value="false"}]
        [{if $oViewConf->getTopActionClassName() == 'start'}]
            [{assign var="homeSelected" value="true"}]
        [{/if}]
        [{assign var="oxcmp_categories" value=$oxcmp_categories}]

        <div class="header__mainnav d-none d-md-block">
            <nav class="navbar navbar-expand-sm" itemscope="itemscope" itemtype="https://schema.org/SiteNavigationElement">
                <div class="collapse navbar-collapse">
                    [{block name="dd_widget_header_categorylist_navbar"}]
                        <ul class="navbar-nav flex-grow-1 justify-content-between">
                            [{block name="dd_widget_header_categorylist_navbar_list"}]
                                [{if $oViewConf->getViewThemeParam('blHomeLink')}]
                                    <li data-level="is-level-1" class="nav-item[{if $homeSelected == 'true'}] active[{/if}]">
                                        <a class="nav-link" href="[{$oViewConf->getHomeLink()}]" itemprop="url"><span itemprop="name">[{oxmultilang ident="HOME"}]</span></a>
                                    </li>
                                [{/if}]

                                [{foreach from=$oxcmp_categories item="ocat" key="catkey" name="root"}]
                                    [{if $ocat->getIsVisible()}]
                                        [{foreach from=$ocat->getContentCats() item="oTopCont" name="MoreTopCms"}]
                                            <li data-level="is-level-1" class="nav-item">
                                                <a class="nav-link[{if $oContent->oxcontents__oxloadid->value === $oTopCont->oxcontents__oxloadid->value}] active[{/if}]" href="[{$oTopCont->getLink()}]" itemprop="url"><span itemprop="name">[{$oTopCont->oxcontents__oxtitle->value}]</span></a>
                                            </li>
                                        [{/foreach}]

                                        <li data-level="is-level-1" class="nav-item[{if $homeSelected == 'false' && $ocat->expanded}] active[{/if}][{if $ocat->getSubCats()}] mega-dropdown[{/if}]">
                                            <a class="nav-link" href="[{$ocat->getLink()}]"[{if $ocat->getSubCats()}] data-toggle="dropdown"[{/if}] itemprop="url">
                                                <span itemprop="name">[{$ocat->oxcategories__oxtitle->value}]</span>
                                                [{if $ocat->getSubCats()}]
                                                    <svg width="11" height="11" viewBox="0 0 11 11" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path d="M2 4.5L5.5 7.5L9 4.5" stroke="#121212" stroke-linecap="square"/>
                                                    </svg>
                                                [{/if}]
                                            </a>

                                            [{if $ocat->getSubCats()}]
                                                <div class="megamenu">
                                                    <div class="row">
                                                        [{foreach from=$ocat->getSubCats() item="osubcat" key="subcatkey" name="SubCat"}]
                                                            [{if $osubcat->getIsVisible()}]
                                                                [{foreach from=$osubcat->getContentCats() item=ocont name=MoreCms}]
                                                                    <div class="col-3">
                                                                        <a [{if $oViewConf->getContentId() == $ocont->getId()}]class="current"[{/if}] href="[{$ocont->getLink()}]" itemprop="url"><span itemprop="name">[{$ocont->oxcontents__oxtitle->value}]</span></a>
                                                                    </div>
                                                                [{/foreach}]

                                                                [{if $osubcat->getIsVisible()}]
                                                                    <div class="col-3 mb-4">
                                                                        <a data-level="is-level-2"[{if $homeSelected == 'false' && $osubcat->expanded}] class="current"[{/if}] href="[{$osubcat->getLink()}]" itemprop="url"><span itemprop="name">[{$osubcat->oxcategories__oxtitle->value}]</span></a>
                                                                        [{foreach from=$osubcat->getSubCats() item=osubsubcat key=subsubcatkey name=SubsubCat}]
                                                                            [{if $osubsubcat->getIsVisible() }]
                                                                                <a data-level="is-level-3" href="[{$osubsubcat->getLink()}]" itemprop="url"><span itemprop="name">[{$osubsubcat->oxcategories__oxtitle->value}]</span></a>
                                                                            [{/if}]
                                                                        [{/foreach}]
                                                                    </div>
                                                                [{/if}]
                                                            [{/if}]
                                                        [{/foreach}]
                                                    </div>
                                                </div>
                                            [{/if}]
                                        </li>
                                    [{/if}]
                                [{/foreach}]
                            [{/block}]
                        </ul>
                    [{/block}]
                </div>
            </nav>
        </div>
    [{/if}]
[{/block}]
