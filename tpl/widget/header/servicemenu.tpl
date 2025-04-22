[{if $oxcmp_user}]
    [{assign var="noticeListCount" value=$oxcmp_user->getNoticeListArtCnt()}]
    [{assign var="wishListCount" value=$oxcmp_user->getWishListArtCnt()}]
    [{assign var="recommListCount" value=$oxcmp_user->getRecommListsCount()}]
[{else}]
    [{assign var="noticeListCount" value="0"}]
    [{assign var="wishListCount" value="0"}]
    [{assign var="recommListCount" value="0"}]
[{/if}]
[{math equation="a+b+c+d" a=$oView->getCompareItemsCnt() b=$noticeListCount c=$wishListCount d=$recommListCount assign="notificationsCounter"}]

<a class="header__actions-account btn" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account"}]">
    <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M19.648 17.875c-1.428-2.468-3.628-4.238-6.196-5.077 1.27-.756 2.256-1.908 2.808-3.28.552-1.37.638-2.884.246-4.31-.392-1.425-1.241-2.682-2.417-3.578C12.915.733 11.478.248 9.999.248c-1.478 0-2.915.485-4.09 1.38-1.176.896-2.025 2.153-2.417 3.578-.392 1.426-.306 2.94.246 4.31.552 1.37 1.538 2.523 2.808 3.279C3.979 13.636 1.779 15.406.351 17.875c-.052.086-.087.181-.102.28-.015.1-.01.201.014.298.025.097.068.189.129.269.061.08.137.148.224.198.087.05.183.082.282.095.1.012.2.005.297-.022.097-.027.187-.073.265-.136.079-.063.144-.14.192-.228C3.416 15.573 6.537 13.75 9.999 13.75c3.462 0 6.584 1.823 8.35 4.875.048.088.113.165.192.228.079.063.168.109.265.136.097.027.198.034.297.022.1-.013.195-.045.282-.095.087-.05.163-.118.224-.198.061-.08.104-.172.129-.269.025-.097.03-.198.014-.298-.015-.099-.05-.194-.102-.28zM4.75 7c0-1.038.308-2.053.885-2.916C6.211 3.22 7.031 2.547 7.99 2.15c.96-.398 2.016-.502 3.035-.3 1.019.202 1.954.702 2.688 1.436.734.735 1.234 1.67 1.436 2.688.203 1.019.099 2.074-.299 3.035-.398.96-1.071 1.78-1.936 2.357-.865.577-1.88.885-2.918.886-1.392 0-2.727-.554-3.712-1.538C5.305 9.727 4.751 8.392 4.75 7z" fill="#112211"/>
    </svg>
    <span>
        [{block name="dd_layout_page_header_icon_menu_account_button"}]
            [{if !$oxcmp_user}]
                [{oxmultilang ident="LOGIN"}] / [{oxmultilang ident="REGISTER"}]
            [{else}]
                [{$oxcmp_user->oxuser__oxfname->value}]
            [{/if}]
        [{/block}]
    </span>
</a>