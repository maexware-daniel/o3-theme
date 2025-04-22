[{if $delivadr}]
    <address [{if $oxid}]id="user_shipppingaddress-address_[{$oxid}]" class="collapse show"[{/if}]>
        [{if $delivadr->oxaddress__oxcompany->value}] [{$delivadr->oxaddress__oxcompany->value}]<br>[{/if}]
        [{if $delivadr->oxaddress__oxaddinfo->value}] [{$delivadr->oxaddress__oxaddinfo->value}]<br>[{/if}]
        [{if $delivadr->oxaddress__oxfname->value || $delivadr->oxaddress__oxlname->value}][{$delivadr->oxaddress__oxfname->value}]&nbsp;[{$delivadr->oxaddress__oxlname->value}]<br>[{/if}]
        [{if $delivadr->oxaddress__oxstreet->value || $delivadr->oxaddress__oxstreetnr->value}][{$delivadr->oxaddress__oxstreet->value}]&nbsp;[{$delivadr->oxaddress__oxstreetnr->value}]<br>[{/if}]
        [{if $delivadr->oxaddress__oxstateid->value}][{$delivadr->oxaddress__oxstateid->value}] [{/if}]
        [{if $delivadr->oxaddress__oxzip->value || $delivadr->oxaddress__oxcity->value}][{$delivadr->oxaddress__oxzip->value}]&nbsp;[{$delivadr->oxaddress__oxcity->value}]<br>[{/if}]
        [{if $delivadr->oxaddress__oxcountry->value}][{$delivadr->oxaddress__oxcountry->value}][{/if}][{if $delivadr->oxaddress__oxfon->value || $delivadr->oxaddress__oxfax->value}]<br><br>[{/if}]
        [{if $delivadr->oxaddress__oxfon->value}][{oxmultilang ident="PHONE"}] [{$delivadr->oxaddress__oxfon->value}][{/if}][{if $delivadr->oxaddress__oxfax->value}]<br>[{/if}]
        [{if $delivadr->oxaddress__oxfax->value}][{oxmultilang ident="FAX"}] [{$delivadr->oxaddress__oxfax->value}][{/if}]
    </address>
[{/if}]
