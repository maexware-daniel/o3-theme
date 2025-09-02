<?php
/**
 * This file is part of O3-Shop.
 *
 * O3-Shop is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 3.
 *
 * O3-Shop is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * General Public License for more details.
 * You should have received a copy of the GNU General Public License
 * along with O3-Shop.  If not, see <http://www.gnu.org/licenses/>.
 *
 * @copyright  Copyright (c) 2022 OXID eSales AG (https://www.oxid-esales.com)
 * @copyright  Copyright (c) 2022 O3-Shop (https://www.o3-shop.com)
 * @license    https://www.gnu.org/licenses/gpl-3.0  GNU General Public License 3 (GPLv3)
 */

/**
 * Theme Information
 */
$aTheme = array(
    'id'          => 'o3-theme',
    'title'       => 'O3-Theme',
    'description' => 'O3-Theme is O3-Shops official responsive theme based on the CSS framework Bootstrap 5.',
    'thumbnail'   => 'theme.png',
    'version'     => '1.0.0',
    'author'      => '<a href="https://www.o3-shop.com" title="O3-Shop">O3-Shop</a>',
    'settings'    => array(
        array(
            'group' => 'images',
            'name'  => 'aDetailImageSizes',
            'type'  => 'aarr',
            'value' => array(
                'oxpic1'  => '752*633',
                'oxpic2'  => '752*633',
                'oxpic3'  => '752*633',
                'oxpic4'  => '752*633',
                'oxpic5'  => '752*633',
                'oxpic6'  => '752*633',
                'oxpic7'  => '752*633',
                'oxpic8'  => '752*633',
                'oxpic9'  => '752*633',
                'oxpic10' => '752*633',
                'oxpic11' => '752*633',
                'oxpic12' => '752*633',
            ),
        ),
        array(
            'group' => 'colors',
            'name'  => 'blPrimaryColor',
            'type'  => 'str',
            'value' => '#2555FF',
        ),
        array(
            'group' => 'colors',
            'name'  => 'blSecondaryColor',
            'type'  => 'str',
            'value' => '#F2F6FF',
        ),
        array(
            'group' => 'colors',
            'name'  => 'blFooterColor',
            'type'  => 'str',
            'value' => '#01071C',
        ),
        array(
            'group' => 'display',
            'name'  => 'aNrofCatArticles',
            'type'  => 'arr',
            'value' => array("10", "20", "50", "100"),
        ),
        array(
            'group' => 'display',
            'name'  => 'aNrofCatArticlesInGrid',
            'type'  => 'arr',
            'value' => array("12", "16", "24", "32"),
        ),
        array(
            'group' => 'features',
            'name'  => 'bl_showCompareList',
            'type'  => 'bool',
            'value' => 1,
        ),
        array(
            'group' => 'features',
            'name'  => 'bl_showGiftWrapping',
            'type'  => 'bool',
            'value' => 1,
        ),
        array(
            'group' => 'features',
            'name'  => 'bl_showListmania',
            'type'  => 'bool',
            'value' => 1,
        ),
        array(
            'group' => 'features',
            'name'  => 'bl_showPriceAlarm',
            'type'  => 'bool',
            'value' => 0,
        ),
        array(
            'group' => 'display',
            'name'  => 'bl_showManufacturer',
            'type'  => 'bool',
            'value' => 1,
        ),
        array(
            'group' => 'features',
            'name'  => 'bl_showVouchers',
            'type'  => 'bool',
            'value' => 1,
        ),
        array(
            'group' => 'features',
            'name'  => 'bl_showWishlist',
            'type'  => 'bool',
            'value' => 1,
        ),
        array(
            'group' => 'article',
            'name'  => 'bl_articleAmountMax',
            'type'  => 'bool',
            'value' => 1,
        ),
        array(
            'group' => 'emails',
            'name'  => 'blEmailsShowProductPictures',
            'type'  => 'bool',
            'value' => 0,
        ),
        array(
            'group' => 'footer',
            'name'  => 'blFooterShowHelp',
            'type'  => 'bool',
            'value' => 1,
        ),
        array(
            'group' => 'footer',
            'name'  => 'blFooterShowLinks',
            'type'  => 'bool',
            'value' => 1,
        ),
        array(
            'group' => 'footer',
            'name'  => 'blFooterShowNews',
            'type'  => 'bool',
            'value' => 1,
        ),
        array(
            'group' => 'footer',
            'name'  => 'blFooterShowNewsletter',
            'type'  => 'bool',
            'value' => 1,
        ),
        array(
            'group' => 'display',
            'name'  => 'blHomeLink',
            'type'  => 'bool',
            'value' => 0,
        ),
        array(
            'group' => 'googleanalytics',
            'name'  => 'blGAAnonymizeIPs',
            'type'  => 'bool',
            'value' => 1,
        ),
        array(
            'group' => 'display',
            'name'  => 'blShowBirthdayFields',
            'type'  => 'bool',
            'value' => 0,
        ),
        array(
            'group' => 'display',
            'name'  => 'blShowFilters',
            'type'  => 'bool',
            'value' => 1,
        ),
        array(
            'group' => 'googleanalytics',
            'name'  => 'blUseGAEcommerceTracking',
            'type'  => 'bool',
            'value' => 1,
        ),
        array(
            'group' => 'googleanalytics',
            'name'  => 'blUseGAPageTracker',
            'type'  => 'bool',
            'value' => 1,
        ),
        array(
            'group' => 'googlets',
            'name'  => 'blUseGoogleTS',
            'type'  => 'bool',
            'value' => 0,
        ),
        array(
            'group' => 'footer',
            'name'  => 'sInstagramUrl',
            'type'  => 'str',
            'value' => 'https://instagram.com',
        ),
        array(
            'group' => 'images',
            'name'  => 'sCatIconsize',
            'type'  => 'str',
            'value' => '168*100',
        ),
        array(
            'group' => 'images',
            'name'  => 'sCatPromotionsize',
            'type'  => 'str',
            'value' => '370*107',
        ),
        array(
            'group' => 'images',
            'name'  => 'sCatThumbnailsize',
            'type'  => 'str',
            'value' => '1296*500',
        ),
        array(
            'group'       => 'display',
            'name'        => 'sDefaultListDisplayType',
            'type'        => 'select',
            'value'       => 'grid',
            'constraints' => 'line|grid',
        ),
        array(
            'group' => 'slider',
            'name'  => 'sSliderSlideFade',
            'type'        => 'select',
            'value'       => 'fade',
            'constraints' => 'slide|fade',
        ),
        array(
            'group' => 'slider',
            'name'  => 'sSliderAutostart',
            'type'        => 'select',
            'value'       => 'on',
            'constraints' => 'on|off',
        ),
        array(
            'group' => 'slider',
            'name'  => 'sSliderInterval',
            'type'  => 'str',
            'value' => '5000',
        ),
        array(
            'group' => 'slider',
            'name'  => 'sSliderSpeed',
            'type'  => 'str',
            'value' => '400',
        ),
        array(
            'group' => 'Jquery',
            'name'  => 'activateJquery',
            'type'  => 'bool',
            'value' => 0,
        ),
        array(
            'group' => 'googlets',
            'name'  => 'sDeliveryDaysNotOnStock',
            'type'  => 'str',
            'value' => '14',
        ),
        array(
            'group' => 'googlets',
            'name'  => 'sDeliveryDaysOnStock',
            'type'  => 'str',
            'value' => '6',
        ),
        array(
            'group' => 'logo',
            'name'  => 'sEmailLogo',
            'type'  => 'str',
            'value' => 'logo.svg',
        ),
        array(
            'group' => 'footer',
            'name'  => 'sFacebookUrl',
            'type'  => 'str',
            'value' => 'https://www.facebook.com',
        ),
        array(
            'group' => 'favicons',
            'name'  => 'sFaviconIcoFile',
            'type'  => 'str',
            'value' => 'favicon.ico',
        ),
        array(
            'group' => 'favicons',
            'name'  => 'sFaviconSvgFile',
            'type'  => 'str',
            'value' => 'icon.svg',
        ),
        array(
            'group' => 'favicons',
            'name'  => 'sFaviconAppleFile',
            'type'  => 'str',
            'value' => 'apple-touch-icon.png',
        ),
        array(
            'group' => 'favicons',
            'name'  => 'sFavicon192PngFile',
            'type'  => 'str',
            'value' => 'icon-192.png',
        ),
        array(
            'group' => 'favicons',
            'name'  => 'sFavicon512PngFile',
            'type'  => 'str',
            'value' => 'icon-512.png',
        ),
        array(
            'group' => 'googleanalytics',
            'name'  => 'sGATrackingId',
            'type'  => 'str',
            'value' => '',
        ),
        array(
            'group' => 'contact',
            'name'  => 'sGoogleMapsAddr',
            'type'  => 'str',
            'value' => 'O3-Shop, Musterstraße 17, 12345 Musterstadt',
        ),
        array(
            'group' => 'googlets',
            'name'  => 'sGoogleShoppingAccountId',
            'type'  => 'str',
            'value' => '',
        ),
        array(
            'group' => 'googlets',
            'name'  => 'sGoogleVendorId',
            'type'  => 'str',
            'value' => '',
        ),
        array(
            'group' => 'images',
            'name'  => 'sIconsize',
            'type'  => 'str',
            'value' => '114*114',
        ),
        array(
            'group' => 'logo',
            'name'  => 'sLogoFile',
            'type'  => 'str',
            'value' => 'logo.svg',
        ),
        array(
            'group' => 'images',
            'name'  => 'sManufacturerIconsize',
            'type'  => 'str',
            'value' => '100*100',
        ),
        array(
            'group' => 'googlets',
            'name'  => 'sPageLanguage',
            'type'  => 'str',
            'value' => 'de_DE',
        ),
        array(
            'group' => 'googlets',
            'name'  => 'sShippingDaysNotOnStock',
            'type'  => 'str',
            'value' => '5',
        ),
        array(
            'group' => 'googlets',
            'name'  => 'sShippingDaysOnStock',
            'type'  => 'str',
            'value' => '3',
        ),
        array(
            'group' => 'googlets',
            'name'  => 'sShoppingCountry',
            'type'  => 'str',
            'value' => 'DE',
        ),
        array(
            'group' => 'googlets',
            'name'  => 'sShoppingLanguage',
            'type'  => 'str',
            'value' => 'de',
        ),
        array(
            'group' => 'images',
            'name'  => 'sThumbnailsize',
            'type'  => 'str',
            'value' => '330*185',
        ),
        array(
            'group' => 'footer',
            'name'  => 'sTwitterUrl',
            'type'  => 'str',
            'value' => 'https://twitter.com',
        ),
        array(
            'group' => 'footer',
            'name'  => 'sYouTubeUrl',
            'type'  => 'str',
            'value' => 'https://www.youtube.com',
        ),
        array(
            'group' => 'images',
            'name'  => 'sZoomImageSize',
            'type'  => 'str',
            'value' => '665*665',
        ),
    ),
);
