[{block name="details_relatedproducts_also_bought"}]
    [{if $oView->getAlsoBoughtTheseProducts()}]
        <div class="component__productslider">
            <h2 class="title-big">[{oxmultilang ident="CUSTOMERS_ALSO_BOUGHT"}]</h2>
            <hr>
            [{include file="widget/product/list_splide.tpl" listId="alsoBought" products=$oView->getAlsoBoughtTheseProducts()}]
        </div>
    [{/if}]
[{/block}]

[{block name="details_relatedproducts_accessoires"}]
    [{if $oView->getAccessoires()}]
        <div class="component__productslider">
            <h2 class="title-big">[{oxmultilang ident="ACCESSORIES"}]</h2>
            <hr>
            [{include file="widget/product/list_splide.tpl" listId="accessories" products=$oView->getAccessoires()}]
        </div>
    [{/if}]
[{/block}]

[{block name="details_relatedproducts_similarproducts"}]
    [{if $oView->getSimilarProducts()}]
        <div class="component__productslider">
            <h2 class="title-big">[{oxmultilang ident="SIMILAR_PRODUCTS"}]</h2>
            <hr>
            [{include file="widget/product/list_splide.tpl" listId="similar"  products=$oView->getSimilarProducts()}]
        </div>
    [{/if}]
[{/block}]

[{block name="details_relatedproducts_crossselling"}]
    [{if $oView->getCrossSelling()}]
        <div class="component__productslider">
            <h2 class="title-big">[{oxmultilang ident="HAVE_YOU_SEEN"}]</h2>
            <hr>
            [{include file="widget/product/list_splide.tpl" listId="cross" products=$oView->getCrossSelling()}]
        </div>
    [{/if}]
[{/block}]