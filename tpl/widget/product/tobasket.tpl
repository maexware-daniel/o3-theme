<div class="component__tobasket"[{if !$blCanBuy}] data-tooltip="[{oxmultilang ident="TO_CART_NOVARIANT"}]"[{/if}] data-js="tobasket">
    <button class="btn component__tobasket-minus" type="button"[{if $value == 1 || $disabled}] disabled[{/if}] data-js="tobasket-minus">
        <svg width="20" height="2" viewBox="0 0 20 2" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M0 1H10H20" stroke="#2555FF" stroke-width="1.5"/>
        </svg>
    </button>
    <input class="component__tobasket-input" type="number" name="[{$name}]" value="[{$value}]" autocomplete="off" min="1" [{if $oViewConf->getViewThemeParam('bl_articleAmountMax')}] max="[{$max}]"[{/if}] step="[{if $oConfig->getConfigParam('blAllowUnevenAmounts')}]any[{else}][{$step}][{/if}]" data-js="tobasket-input"[{if $disabled}] disabled[{/if}]>
    <button class="btn component__tobasket-plus" type="button"[{if ($oViewConf->getViewThemeParam('bl_articleAmountMax') && $value >= $max) || $disabled}] disabled[{/if}] data-js="tobasket-plus">
        <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M10 0V10M10 20V10M10 10H0M10 10H20" stroke="#2555FF" stroke-width="1.5"/>
        </svg>
    </button>
    [{if $submit}]
        <button type="submit" class="btn btn-primary component__tobasket-submit">
            <span>[{oxmultilang ident="TO_CART"}]</span>
            <svg width="52" height="52" viewBox="0 0 52 52" fill="none" xmlns="http://www.w3.org/2000/svg">
                <rect width="52" height="52" fill="white" fill-opacity="0.08"/>
                <path d="M29.4286 20.6757H32C33.1046 20.6757 34 21.5711 34 22.6757V34C34 35.1046 33.1046 36 32 36H20C18.8954 36 18 35.1046 18 34V22.6757C18 21.5711 18.8954 20.6757 20 20.6757H22.5714M29.4286 20.6757V23.5135M29.4286 20.6757V17C29.4286 15.8954 28.5331 15 27.4286 15H24.5714C23.4669 15 22.5714 15.8954 22.5714 17V20.6757M29.4286 20.6757H22.5714M22.5714 20.6757V23.5135" stroke="white" stroke-width="1.5"/>
            </svg>
        </button>
    [{/if}]
</div>