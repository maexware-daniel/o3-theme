[{block name="dd_widget_breadcrumb"}]
    [{strip}]
        [{block name="dd_widget_breadcrumb_list_inner"}]
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb" itemscope itemtype="https://schema.org/BreadcrumbList">
                    [{block name="dd_widget_breadcrumb_list"}]
                        <li class="breadcrumb-item" itemscope itemtype="https://schema.org/ListItem" itemprop="itemListElement">
                            <a href="[{$oViewConf->getHomeLink()}]" itemprop="item"><span itemprop="name">[{oxmultilang ident="HOME"}]</span></a>
                            <meta itemprop="position" content="1" />
                        </li>
                        [{foreach from=$oView->getBreadCrumb() item="sCrum" name="breadcrumb"}]
                            <li class="breadcrumb-item[{if $smarty.foreach.breadcrumb.last}] active[{/if}]"[{if $smarty.foreach.breadcrumb.last}] aria-current="page"[{/if}] itemscope itemtype="https://schema.org/ListItem" itemprop="itemListElement">
                                [{if $sCrum.link}]
                                    <a href="[{$sCrum.link}]" itemprop="item">
                                        <span itemprop="name">[{$sCrum.title}]</span>
                                    </a>
                                [{else}]
                                    <span itemprop="name">[{$sCrum.title}]</span>
                                [{/if}]
                                <meta itemprop="position" content="[{$smarty.foreach.breadcrumb.iteration+1}]" />
                            </li>
                        [{/foreach}]
                    [{/block}]
                </ol>
            </nav>
        [{/block}]
    [{/strip}]
[{/block}]
