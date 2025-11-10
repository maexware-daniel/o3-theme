[{assign var="listType" value=$oView->getListDisplayType()}]
[{assign var="_additionalParams" value=$oView->getAdditionalParams()}]
[{assign var="_artPerPage" value=$oViewConf->getArtPerPageCount()}]

[{if $oView->canSelectDisplayType()}]
    <div class="alist__orga-type d-inline-flex">
        [{if $listType eq 'grid'}]
            <div class="btn btn-outline-primary">
                <svg width="16" height="16" xmlns="http://www.w3.org/2000/svg" fill="none">
                    <rect stroke-width="1.4" stroke="#121212" height="5.61404" width="5.61404" y="0.7" x="0.7"/>
                    <rect stroke-width="1.4" stroke="#121212" height="5.61403" width="5.61404" y="9.7" x="0.7"/>
                    <rect stroke-width="1.4" stroke="#121212" height="5.61404" width="5.61404" y="0.7" x="9.7"/>
                    <rect stroke-width="1.4" stroke="#121212" height="5.61403" width="5.61404" y="9.7" x="9.7"/>
                </svg>
            </div>
        [{else}]
            <a href="[{$oView->getLink()|oxaddparams:"ldtype=grid&amp;_artperpage=$_artPerPage&amp;pgNr=0&amp;$_additionalParams"}]" class="btn">
                <svg width="16" height="16" xmlns="http://www.w3.org/2000/svg" fill="none">
                    <rect stroke-width="1.4" stroke="#121212" height="5.61404" width="5.61404" y="0.7" x="0.7"/>
                    <rect stroke-width="1.4" stroke="#121212" height="5.61403" width="5.61404" y="9.7" x="0.7"/>
                    <rect stroke-width="1.4" stroke="#121212" height="5.61404" width="5.61404" y="0.7" x="9.7"/>
                    <rect stroke-width="1.4" stroke="#121212" height="5.61403" width="5.61404" y="9.7" x="9.7"/>
                </svg>
            </a>
        [{/if}]
        [{if $listType eq 'line'}]
            <div class="btn btn-outline-primary">
                <svg width="14" height="12" viewBox="0 0 14 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M-0.000976562 0.999878H13.3324" stroke="#121212" stroke-width="1.4"/>
                    <path d="M-0.000976562 5.99988H13.3324" stroke="#121212" stroke-width="1.4"/>
                    <path d="M-0.000976562 10.9999H13.3324" stroke="#121212" stroke-width="1.4"/>
                </svg>
            </div>
        [{else}]
            <a href="[{$oView->getLink()|oxaddparams:"ldtype=line&amp;_artperpage=$_artPerPage&amp;pgNr=0&amp;$_additionalParams"}]" class="btn">
                <svg width="14" height="12" viewBox="0 0 14 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M-0.000976562 0.999878H13.3324" stroke="#121212" stroke-width="1.4"/>
                    <path d="M-0.000976562 5.99988H13.3324" stroke="#121212" stroke-width="1.4"/>
                    <path d="M-0.000976562 10.9999H13.3324" stroke="#121212" stroke-width="1.4"/>
                </svg>
            </a>
        [{/if}]
    </div>
[{/if}]