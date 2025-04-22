<button class="header__actions-cart btn position-relative" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvas__basket" aria-controls="offcanvas__basket">
    [{block name="dd_layout_page_header_icon_menu_minibasket_button"}]
        <svg width="18" height="23" viewBox="0 0 18 23" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M12.429 6.676H15c1.105 0 2 .895 2 2v11.324c0 1.105-.895 2-2 2H3c-1.105 0-2-.895-2-2V8.676c0-1.105.895-2 2-2h2.571M12.429 6.676V9.514M12.429 6.676V3c0-1.105-.895-2-2-2H7.571c-1.105 0-2 .895-2 2v3.676M12.429 6.676H5.571M5.571 6.676V9.514" stroke="#112211" stroke-width="1.5"/>
        </svg>
        <span class="badge-counter">
            [{$oxcmp_basket->getItemsCount()}]
        </span>
    [{/block}]
</button>

<div class="offcanvas offcanvas-end[{if $oxcmp_basket->isNewItemAdded()}] show[{/if}]" tabindex="-1" id="offcanvas__basket">
    [{block name="dd_layout_page_header_icon_menu_minibasket_list"}]
        [{oxid_include_dynamic file="widget/minibasket/minibasket.tpl"}]
    [{/block}]
</div>