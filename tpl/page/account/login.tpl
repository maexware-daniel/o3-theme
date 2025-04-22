[{assign var="template_title" value="REGISTER"|oxmultilangassign}]
[{capture append="oxidBlock_content"}]

    [{include file="form/login_account.tpl"}]

    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]

[{include file="layout/page.tpl"}]