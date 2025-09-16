[{block name="footer_main"}]

    [{if $oxcmp_user}]
        [{assign var="force_sid" value=$oView->getSidForWidget()}]
    [{/if}]

    <footer>

        <div class="footer__logo">
            [{assign var="slogoImg" value=$oViewConf->getViewThemeParam('sLogoFile')}]
            <img src="[{$oViewConf->getImageUrl($slogoImg)}]" alt="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]">
        </div>

        <div class="container-xxl">
            <div class="row">

                [{block name="dd_footer_information"}]
                    <section class="col-12 col-lg-4 footer__box" itemscope itemtype="https://schema.org/Organization">

                        <div class="footer__box-content">
                            <div class="footer__box-title">[{oxmultilang ident="INFORMATION"}]</div>
                            [{block name="dd_footer_information_inner"}]
                                [{oxid_include_widget cl="oxwInformation" noscript=1 nocookie=1 force_sid=$force_sid}]
                            [{/block}]

                            [{block name="dd_footer_social_links"}]
                                [{if $oViewConf->getViewThemeParam('sFacebookUrl') || $oViewConf->getViewThemeParam('sTwitterUrl') || $oViewConf->getViewThemeParam('sYouTubeUrl') || $oViewConf->getViewThemeParam('sInstagramUrl')}]

                                    [{block name="dd_footer_social_links_inner"}]

                                        [{block name="dd_footer_social_links_list"}]
                                            [{if $oViewConf->getViewThemeParam('sFacebookUrl')}]
                                                <a target="_blank" class="footer__box-social"
                                                   rel="noopener"
                                                   href="[{$oViewConf->getViewThemeParam('sFacebookUrl')}]">
                                                    <svg width="13" height="22" viewBox="0 0 13 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path d="M12 1.00012H9C7.67392 1.00012 6.40215 1.52691 5.46447 2.46459C4.52678 3.40227 4 4.67404 4 6.00012V9.00012H1V13.0001H4V21.0001H8V13.0001H11L12 9.00012H8V6.00012C8 5.73491 8.10536 5.48055 8.29289 5.29302C8.48043 5.10548 8.73478 5.00012 9 5.00012H12V1.00012Z" stroke="#fff" stroke-linecap="round" stroke-linejoin="round"/>
                                                    </svg>
                                                </a>
                                            [{/if}]

                                            [{if $oViewConf->getViewThemeParam('sTwitterUrl')}]
                                                <a target="_blank" class="footer__box-social"
                                                   rel="noopener"
                                                   href="[{$oViewConf->getViewThemeParam('sTwitterUrl')}]">
                                                    <svg width="24" height="20" viewBox="0 0 24 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path d="M23 1.00017C22.0424 1.67565 20.9821 2.19228 19.86 2.53017C19.2577 1.83768 18.4573 1.34686 17.567 1.12409C16.6767 0.901328 15.7395 0.957364 14.8821 1.28462C14.0247 1.61188 13.2884 2.19457 12.773 2.95388C12.2575 3.7132 11.9877 4.6125 12 5.53017V6.53017C10.2426 6.57574 8.50127 6.18598 6.93101 5.39561C5.36074 4.60525 4.01032 3.4388 3 2.00017C3 2.00017 -1 11.0002 8 15.0002C5.94053 16.3981 3.48716 17.0991 1 17.0002C10 22.0002 21 17.0002 21 5.50017C20.9991 5.22162 20.9723 4.94376 20.92 4.67017C21.9406 3.66366 22.6608 2.39288 23 1.00017Z" stroke="#fff" stroke-linecap="round" stroke-linejoin="round"/>
                                                    </svg>
                                                </a>
                                            [{/if}]

                                            [{if $oViewConf->getViewThemeParam('sYouTubeUrl')}]
                                                <a target="_blank" class="footer__box-social"
                                                   rel="noopener"
                                                   href="[{$oViewConf->getViewThemeParam('sYouTubeUrl')}]">
                                                    <svg width="23" height="16.5" xmlns="http://www.w3.org/2000/svg" fill="none">
                                                        <g>
                                                            <path stroke-linejoin="round" stroke-linecap="round" stroke="#fff" d="m22.0396,2.92013c-0.1188,-0.47459 -0.3607,-0.90943 -0.7014,-1.26059c-0.3406,-0.35117 -0.7679,-0.60622 -1.2386,-0.73941c-1.72,-0.42 -8.6,-0.42 -8.6,-0.42c0,0 -6.88,0 -8.6,0.46c-0.47076,0.13319 -0.89803,0.38824 -1.23866,0.73941c-0.34063,0.35116 -0.58256,0.786 -0.70134,1.26059c-0.31479,1.74556 -0.46877,3.51631 -0.46,5.28998c-0.01123,1.7871 0.14276,3.5713 0.46,5.33c0.13095,0.4599 0.3783,0.8782 0.71814,1.2145c0.33984,0.3363 0.76068,0.5793 1.22186,0.7055c1.72,0.46 8.6,0.46 8.6,0.46c0,0 6.88,0 8.6,-0.46c0.4707,-0.1332 0.898,-0.3882 1.2386,-0.7394c0.3407,-0.3512 0.5826,-0.786 0.7014,-1.2606c0.3124,-1.7324 0.4663,-3.4896 0.46,-5.25c0.0112,-1.78702 -0.1428,-3.57128 -0.46,-5.32998z"/>
                                                            <path stroke-linejoin="round" stroke-linecap="round" stroke-width="1.5" stroke="#fff" d="m9.25,11.52011l5.75,-3.27l-5.75,-3.27l0,6.54z"/>
                                                        </g>
                                                    </svg>
                                                </a>
                                            [{/if}]

                                            [{if $oViewConf->getViewThemeParam('sInstagramUrl')}]
                                                <a target="_blank" class="footer__box-social"
                                                   rel="noopener"
                                                   href="[{$oViewConf->getViewThemeParam('sInstagramUrl')}]">
                                                    <svg width="21" height="21" xmlns="http://www.w3.org/2000/svg" fill="none">
                                                        <g>
                                                            <path stroke-linejoin="round" stroke-linecap="round" stroke="#fff" d="m15.5,0.50012l-10,0c-2.76142,0 -5,2.23858 -5,5l0,9.99998c0,2.7614 2.23858,5 5,5l10,0c2.7614,0 5,-2.2386 5,-5l0,-9.99998c0,-2.76142 -2.2386,-5 -5,-5z"/>
                                                            <path stroke-linejoin="round" stroke-linecap="round" stroke="#fff" d="m14.4997,9.8702c0.1234,0.8322 -0.0187,1.6822 -0.4062,2.429c-0.3875,0.7468 -1.0006,1.3524 -1.7522,1.7307c-0.7515,0.3782 -1.6031,0.5099 -2.4338,0.3762c-0.8307,-0.1337 -1.59803,-0.5258 -2.19295,-1.1208c-0.59493,-0.5949 -0.98711,-1.3622 -1.12078,-2.1929c-0.13366,-0.8307 -0.002,-1.6823 0.37626,-2.4338c0.37826,-0.75157 0.98386,-1.36468 1.73067,-1.75218c0.7468,-0.3875 1.5968,-0.52965 2.429,-0.40624c0.8489,0.12588 1.6349,0.52146 2.2417,1.12831c0.6068,0.60684 1.0024,1.39281 1.1283,2.24171z"/>
                                                            <path stroke-linejoin="round" stroke-linecap="round" stroke-width="1.5" stroke="#fff" d="m16,5.00012l0.01,0"/>
                                                        </g>
                                                    </svg>
                                                </a>
                                            [{/if}]
                                        [{/block}]

                                    [{/block}]

                                [{/if}]

                                [{block name="footer_social"}]
                                [{/block}]

                            [{/block}]
                        </div>
                    </section>
                [{/block}]

                [{block name="dd_footer_categorytree"}]
                    <section class="col-12 col-md-6 col-lg-4 footer__box">
                        <div class="footer__box-content">
                            <div class="footer__box-title">[{oxmultilang ident="CATEGORIES"}]</div>
                            [{block name="dd_footer_categorytree_inner"}]
                                [{oxid_include_widget cl="oxwCategoryTree" _parent=$oView->getClassName() sWidgetType="footer" noscript=1 nocookie=1}]
                            [{/block}]
                        </div>
                    </section>
                [{/block}]

                [{block name="dd_footer_servicelist"}]
                    <section class="col-12 col-md-6 col-lg-4 footer__box">
                        <div class="footer__box-content">
                            <div class="footer__box-title">[{oxmultilang ident="SERVICES"}]</div>
                            [{block name="dd_footer_servicelist_inner"}]
                                [{oxid_include_widget cl="oxwServiceList" noscript=1 nocookie=1 force_sid=$force_sid}]
                            [{/block}]
                        </div>
                    </section>
                [{/block}]

            </div>

        </div>

        <div class="footer__legal">
            <div class="container-xxl">

                <div>
                    [{if $oView->isPriceCalculated()}]
                        [{block name="layout_page_vatinclude"}]
                            [{block name="footer_deliveryinfo"}]
                                [{oxifcontent ident="oxdeliveryinfo" object="oCont"}]
                                    [{if $oView->isVatIncluded()}]
                                        <span class="vat-info-text">* [{oxmultilang ident="PLUS_SHIPPING"}]<a href="[{$oCont->getLink()}]">[{oxmultilang ident="PLUS_SHIPPING2"}]</a></span>
                                    [{else}]
                                        <span class="vat-info-text">* [{oxmultilang ident="PLUS"}]<a href="[{$oCont->getLink()}]">[{oxmultilang ident="PLUS_SHIPPING2"}]</a></span>
                                    [{/if}]
                                [{/oxifcontent}]
                            [{/block}]
                        [{/block}]
                    [{/if}]
                </div>

                <div>
                    [{oxifcontent ident="oxstdfooter" object="oCont"}]
                        <div class="legal">
                            [{block name="dd_footer_copyright"}]
                                [{$oCont->oxcontents__oxcontent->value}]
                            [{/block}]
                        </div>
                    [{/oxifcontent}]
                    [{oxmultilang ident="DD_FOOTER_O3ShopLink"}]
                </div>

                <div class="d-flex gap-5">
                    [{oxifcontent ident="oximpressum" object="_cont"}]
                        <div><a href="[{$_cont->getLink()}]">[{$_cont->oxcontents__oxtitle->value}]</a></div>
                    [{/oxifcontent}]
                    [{oxifcontent ident="oxagb" object="_cont"}]
                        <div><a href="[{$_cont->getLink()}]">[{$_cont->oxcontents__oxtitle->value}]</a></div>
                    [{/oxifcontent}]
                </div>

            </div>
        </div>

    </footer>
[{/block}]