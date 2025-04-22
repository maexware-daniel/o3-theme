[{assign var="currency" value=$oView->getActCurrency()}]

<table class="details__price-scaled">
    <thead>
        <tr>
            <th scope="col">[{oxmultilang ident="O3_QUANTITY"}]</th>
            <th scope="col">[{oxmultilang ident="O3_UNIT_PRICE"}]</th>
        </tr>
    </thead>
    <tbody>
        [{foreach from=$oDetailsProduct->loadAmountPriceInfo() item=priceItem name=amountPrice}]
            <tr>
                <td>[{oxmultilang ident="O3_FROM"}] [{$priceItem->oxprice2article__oxamount->value}]</td>
                <td>
                    [{if $priceItem->oxprice2article__oxaddperc->value}]
                        [{$priceItem->oxprice2article__oxaddperc->value}]% [{oxmultilang ident="DISCOUNT"}]
                    [{else}]
                        [{block name="details_productmain_price"}]
                            [{if $oView->isVatIncluded()}]
                                [{$priceItem->fbrutprice}] [{$currency->sign}]
                                [{if $oDetailsProduct->getUnitName() and $priceItem->fbrutamountprice}]
                                    &nbsp;([{$priceItem->fbrutamountprice}] [{$currency->sign}] / [{$oDetailsProduct->getUnitName()}])
                                [{/if}]
                            [{else}]
                                [{$priceItem->fnetprice}] [{$currency->sign}]
                                [{if $oDetailsProduct->getUnitName() and $priceItem->fnetamountprice}]
                                    &nbsp;([{$priceItem->fnetamountprice}] [{$currency->sign}] / [{$oDetailsProduct->getUnitName()}])
                                [{/if}]
                            [{/if}]
                        [{/block}]
                    [{/if}]
                </td>
            </tr>
        [{/foreach}]
    </tbody>
</table>




