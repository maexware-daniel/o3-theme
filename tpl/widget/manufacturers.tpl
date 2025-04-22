<div class="start__manufacturer">
    <h3 class="title-big">[{oxmultilang ident="OUR_BRANDS"}]</h3>
    <hr>
    <div class="grid gap-3">
        [{foreach name=amount from=$oView->getManufacturerForSlider() item=oManufacturer}]
            [{if $oManufacturer->oxmanufacturers__oxicon->value && $smarty.foreach.amount.index < 12}]
                <a class="start__manufacturer-box g-col-6 g-col-sm-4 g-col-lg-2" href="[{$oManufacturer->getLink()}]" title="[{oxmultilang ident="VIEW_ALL_PRODUCTS"}]">
                    <img src="[{$oManufacturer->getIconUrl()}]" alt="[{$oManufacturer->oxmanufacturers__oxtitle->value}]">
                </a>
            [{/if}]
        [{/foreach}]
    </div>
    [{if $smarty.foreach.amount.index > 11}]
        <a class="btn btn-outline-primary mt-3 start__manufacturer-allbrands" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=manufacturerlist&mnid=root"}]" title="[{oxmultilang ident="VIEW_ALL_PRODUCTS"}]">
            [{oxmultilang ident="ALL_BRANDS"}]
            <svg width="13" height="13" viewBox="0 0 13 13" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M12.7492 1.19668C12.7492 0.782468 12.4134 0.446682 11.9992 0.446682L5.24918 0.446681C4.83497 0.446681 4.49918 0.782468 4.49918 1.19668C4.49918 1.6109 4.83497 1.94668 5.24918 1.94668H11.2492V7.94668C11.2492 8.3609 11.585 8.69668 11.9992 8.69668C12.4134 8.69668 12.7492 8.3609 12.7492 7.94668L12.7492 1.19668ZM1.92291 12.3336L12.5295 1.72701L11.4689 0.666351L0.862248 11.273L1.92291 12.3336Z" fill="#2555FF"/>
            </svg>
        </a>
    [{/if}]
</div>
