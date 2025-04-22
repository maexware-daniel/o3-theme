[{capture append="oxidBlock_pageBody"}]
    [{if $oView->showRDFa()}]
        [{include file="rdfa/rdfa.tpl"}]
    [{/if}]

    [{block name="layout_header"}]
        [{include file="layout/header.tpl"}]
    [{/block}]

    <main>
        <div class="container-xxl">

            [{if $oView->getClassName() != "start" && !$blHideBreadcrumb}]
                [{block name="layout_breadcrumb"}]
                    [{include file="widget/breadcrumb.tpl"}]
                [{/block}]
            [{/if}]

            [{$smarty.capture.loginErrors}]

            [{block name="content_main"}]
                [{include file="message/errors.tpl"}]

                [{foreach from=$oxidBlock_content item="_block"}]
                    [{$_block}]
                [{/foreach}]
            [{/block}]

        </div>
    </main>

    [{include file="layout/footer.tpl"}]

    [{block name="layout_init_social"}]
    [{/block}]

[{/capture}]
[{include file="layout/base.tpl"}]
