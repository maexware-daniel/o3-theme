[{assign var="listType" value=$oView->getListDisplayType()}]
[{assign var="_additionalParams" value=$oView->getAdditionalParams()}]
[{assign var="_artPerPage" value=$oViewConf->getArtPerPageCount()}]

[{if $oView->canSelectDisplayType()}]
    <div class="btn-group d-none d-md-inline-flex">
        <a href="[{$oView->getLink()|oxaddparams:"ldtype=grid&amp;_artperpage=$_artPerPage&amp;pgNr=0&amp;$_additionalParams"}]" class="filter-link[{if $listType eq 'grid'}] selected[{/if}]">[{oxmultilang ident="grid"}]</a>
        <a href="[{$oView->getLink()|oxaddparams:"ldtype=line&amp;_artperpage=$_artPerPage&amp;pgNr=0&amp;$_additionalParams"}]" class="filter-link[{if $listType eq 'line'}] selected[{/if}]">[{oxmultilang ident="line"}]</a>
    </div>
[{/if}]