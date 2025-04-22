[{capture append="oxidBlock_content"}]

    <div class="row">

        <div class="col-12 col-md-4 col-lg-3 mb-5">
            [{include file="layout/sidebar.tpl" content="account" active_link="reviewlist"}]
        </div>

        <div class="col-12 col-md-7 col-lg-8 offset-md-1">

            [{block name="account_reviewlist_header"}]
                [{assign var="template_title" value="MY_REVIEWS"|oxmultilangassign}]
                <h1 class="title-big">[{oxmultilang ident="MY_REVIEWS"}]</h1>
            [{/block}]

            [{block name="account_reviewlist_list"}]

                [{if $oView->getReviewAndRatingItemsCount() }]

                    [{foreach from=$oView->getReviewList() item=review name=ReviewsCounter}]
                        [{block name="account_reviewlist_item"}]

                            <div class="account_review" itemprop="review" itemscope itemtype="https://schema.org/Review">

                                <div>
                                    <strong itemprop="itemreviewed">[{$review->getObjectTitle()|truncate:60}]</strong><time itemprop="datePublished" datetime="[{$review->getCreatedAt()|date_format:"%Y-%m-%d"}]">[{$review->getCreatedAt()|date_format:"%d.%m.%Y"}]</time>
                                </div>

                                [{if $review->getRating()}]
                                    <div class="account_review__rating" itemprop="reviewRating" itemscope itemtype="https://schema.org/Rating">
                                        [{section name="starRatings" start=0 loop=5}]
                                            [{if $review->getRating() >= $smarty.section.starRatings.iteration}]
                                                <div class="star filled"></div>
                                            [{else}]
                                                <div class="star"></div>
                                            [{/if}]
                                        [{/section}]
                                    </div>
                                [{/if}]

                                [{if $review->getReviewText()}]
                                    <div itemprop="description">[{$review->getReviewText()}]</div>
                                [{/if}]

                                [{block name="account_reviewlist_item_action"}]
                                    <button type="submit" class="btn btn-danger" title="[{oxmultilang ident="DD_DELETE_REVIEW_AND_RATING"}]" data-bs-toggle="modal" data-bs-target="#delete_review_[{$smarty.foreach.ReviewsCounter.iteration}]">
                                        [{oxmultilang ident="DD_DELETE"}]
                                    </button>
                                [{/block}]
                            </div>
                        [{/block}]

                        [{include
                            file="page/account/delete_review_confirmation.tpl"
                            reviewId=$review->getReviewId()
                            ratingId=$review->getRatingId()
                            reviewCounterIteration=$smarty.foreach.ReviewsCounter.iteration
                        }]
                    [{/foreach}]

                [{else}]
                    [{block name="account_reviewlist_no_reviews_available"}]
                        <div class="alert alert-info">
                            [{oxmultilang ident="DD_REVIEWS_NOT_AVAILABLE"}]
                        </div>
                    [{/block}]
                [{/if}]

            [{/block}]

            [{block name="account_reviewlist_locator"}]
                [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigation() place="bottom"}]
            [{/block}]

        </div>
    </div>
    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]

[{include file="layout/page.tpl"}]
