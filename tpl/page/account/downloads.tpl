[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value="MY_DOWNLOADS"|oxmultilangassign}]

    <div class="row">

        <div class="col-12 col-md-4 col-lg-3 mb-5">
            [{include file="layout/sidebar.tpl" content="account" active_link="downloads"}]
        </div>

        <div class="col-12 col-md-7 col-lg-8 offset-md-1">
            <h1 class="title-big">[{oxmultilang ident="MY_DOWNLOADS"}]</h1>

            [{if $oView->getOrderFilesList()|count}]

                [{foreach from=$oView->getOrderFilesList() item="oOrderArticle"}]

                    [{foreach from=$oOrderArticle.oxorderfiles item="oOrderFile"}]
                        <div class="download">
                            <div>
                                <strong>[{$oOrderArticle.oxarticletitle}] &nbsp;-&nbsp; [{oxmultilang ident="ORDER_NUMBER"}]: [{$oOrderArticle.oxordernr}]</strong>[{$oOrderArticle.oxorderdate|date_format:"%d.%m.%Y"}]
                            </div>

                            [{if $oOrderFile->isPaid() || !$oOrderFile->oxorderfiles__oxpurchasedonly->value }]

                                [{if $oOrderFile->isValid()}]
                                    <div>[{oxmultilang ident="DD_FILE_ATTRIBUTES_FILENAME" suffix="COLON"}] [{$oOrderFile->oxorderfiles__oxfilename->value}]</div>
                                    <div>[{include file="page/account/inc/file_attributes.tpl"}]</div>

                                    <a class="btn btn-success" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=download" params="sorderfileid="|cat:$oOrderFile->getId()}]" title="[{$oOrderFile->oxorderfiles__oxfilename->value}] [{oxmultilang ident="DD_DOWNLOADS_DOWNLOAD_TOOLTIP"}]">
                                        [{oxmultilang ident="DD_DOWNLOADS_DOWNLOAD_TOOLTIP"}]
                                    </a>
                                [{else}]

                                    <div>[{oxmultilang ident="DD_FILE_ATTRIBUTES_FILENAME" suffix="COLON"}] [{$oOrderFile->oxorderfiles__oxfilename->value}]</div>

                                    <div>
                                        <a class="btn btn-danger" title="[{$oOrderFile->oxorderfiles__oxfilename->value}] [{oxmultilang ident="DD_DOWNLOADS_DOWNLOAD_TOOLTIP"}]" disabled>
                                            [{oxmultilang ident="DD_DOWNLOADS_DOWNLOAD_TOOLTIP"}]
                                        </a>
                                        [{oxmultilang ident="DOWNLOAD_LINK_EXPIRED_OR_MAX_COUNT_RECEIVED"}]
                                    </div>
                                [{/if}]

                            [{else}]
                                <div>
                                    <span class="downloadableFile pending">[{$oOrderFile->oxorderfiles__oxfilename->value}]</span>
                                    <strong>[{oxmultilang ident="DOWNLOADS_PAYMENT_PENDING"}]</strong>
                                </div>
                            [{/if}]

                        </div>
                    [{/foreach}]

                [{/foreach}]

            [{else}]
                <p class="alert alert-info">[{oxmultilang ident="DOWNLOADS_EMPTY"}]</p>
            [{/if}]
        </div>

    </div>

    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]
[{capture append="oxidBlock_sidebar"}]
    [{include file="page/account/inc/account_menu.tpl" active_link="downloads"}]
[{/capture}]
[{include file="layout/page.tpl"}]