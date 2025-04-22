
[{assign var="iRatingValue" value=$oView->getRatingValue()}]

[{if $iRatingValue}][{strip}]
    <div class="d-none" itemtype="https://schema.org/AggregateRating" itemscope="" itemprop="aggregateRating">
        <span itemprop="worstRating">1</span>
        <span itemprop="bestRating ">5</span>
        <span itemprop="ratingValue">[{$iRatingValue}]</span>
        <span itemprop="reviewCount">[{$oView->getRatingCount()}]</span>
    </div>
[{/strip}][{/if}]

[{if !$oxcmp_user}]
    [{assign var="_star_title" value="MESSAGE_LOGIN_TO_RATE"|oxmultilangassign}]
[{elseif !$oView->canRate()}]
    [{assign var="_star_title" value="MESSAGE_ALREADY_RATED"|oxmultilangassign}]
[{else}]
    [{assign var="_star_title" value="MESSAGE_RATE_THIS_ARTICLE"|oxmultilangassign}]
[{/if}]

<a href="#" class="details__info-rating" title="[{$_star_title}]">

    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
        <rect width="24" height="24" rx="12" fill="#FFB628" fill-opacity="0.15"/>
        <path d="M18.996 9.95681C18.986 9.92706 18.9596 9.90537 18.9281 9.90093L14.7095 9.30273C14.3859 9.25683 14.105 9.05561 13.9575 8.76387L12.0757 5.04215C12.0474 4.98595 11.9529 4.98595 11.9248 5.04215L10.0428 8.76405C9.89525 9.05578 9.61444 9.25699 9.29077 9.30289L5.07217 9.9011C5.04051 9.90554 5.01408 9.92723 5.00415 9.95697C4.99421 9.98671 5.00246 10.0193 5.02536 10.0411L8.06333 12.9313C8.30595 13.1621 8.41693 13.499 8.35898 13.8288L7.64306 17.9034C7.63767 17.9343 7.65064 17.9655 7.67657 17.9837C7.7025 18.0023 7.73701 18.0049 7.7653 17.99L11.5435 16.051C11.8301 15.9039 12.17 15.9039 12.4567 16.051L16.2353 17.9903C16.2475 17.9967 16.2609 18 16.2744 18C16.2919 18 16.3091 17.9946 16.3237 17.9841C16.3497 17.966 16.3626 17.9346 16.3572 17.9037L15.641 13.829C15.583 13.4992 15.694 13.1622 15.9367 12.9314L18.9744 10.0414C18.9978 10.0194 19.0056 9.98671 18.996 9.95681Z" stroke="#FFB628" stroke-width="1"/>

        [{if $iRatingValue <= 1}]
            [{assign var="starFilling" value="10"}]
        [{elseif $iRatingValue <= 2}]
            [{assign var="starFilling" value="11"}]
        [{elseif $iRatingValue <= 2.5}]
            [{assign var="starFilling" value="12"}]
        [{elseif $iRatingValue <= 3.5}]
            [{assign var="starFilling" value="14"}]
        [{elseif $iRatingValue <= 4.5}]
            [{assign var="starFilling" value="15"}]
        [{elseif $iRatingValue <= 5}]
            [{assign var="starFilling" value="18"}]
        [{/if}]

        <defs>
            <clipPath id="halfFill">
                <rect x="0" y="0" width="[{$starFilling}]" height="24" />
            </clipPath>
        </defs>

        <path d="M18.996 9.95681C18.986 9.92706 18.9596 9.90537 18.9281 9.90093L14.7095 9.30273C14.3859 9.25683 14.105 9.05561 13.9575 8.76387L12.0757 5.04215C12.0474 4.98595 11.9529 4.98595 11.9248 5.04215L10.0428 8.76405C9.89525 9.05578 9.61444 9.25699 9.29077 9.30289L5.07217 9.9011C5.04051 9.90554 5.01408 9.92723 5.00415 9.95697C4.99421 9.98671 5.00246 10.0193 5.02536 10.0411L8.06333 12.9313C8.30595 13.1621 8.41693 13.499 8.35898 13.8288L7.64306 17.9034C7.63767 17.9343 7.65064 17.9655 7.67657 17.9837C7.7025 18.0023 7.73701 18.0049 7.7653 17.99L11.5435 16.051C11.8301 15.9039 12.17 15.9039 12.4567 16.051L16.2353 17.9903C16.2475 17.9967 16.2609 18 16.2744 18C16.2919 18 16.3091 17.9946 16.3237 17.9841C16.3497 17.966 16.3626 17.9346 16.3572 17.9037L15.641 13.829C15.583 13.4992 15.694 13.1622 15.9367 12.9314L18.9744 10.0414C18.9978 10.0194 19.0056 9.98671 18.996 9.95681Z" fill="#FFB628" clip-path="url(#halfFill)"/>
    </svg>
    <span>[{$iRatingValue|string_format:"%.1f"}]</span>
</a>