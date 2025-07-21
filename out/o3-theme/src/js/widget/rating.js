document.addEventListener("DOMContentLoaded", function() {
    const stars = document.querySelectorAll(".details__reviews-rating .star");
    const artratingInput = document.querySelector('input[name="artrating"]');
    const recommlistratingInput = document.querySelector('input[name="recommlistrating"]');
    let selectedRating = 0;

    // Prüfe, ob beide Inputs existieren
    const inputsExist = artratingInput && recommlistratingInput;

    stars.forEach((star, index) => {
        star.addEventListener("mouseenter", () => {
            fillStars(index + 1);
        });

        star.addEventListener("mouseleave", () => {
            fillStars(selectedRating);
        });

        star.addEventListener("click", () => {
            selectedRating = index + 1;

            // Setze nur den Wert, wenn beide Inputs existieren
            if (inputsExist) {
                artratingInput.value = selectedRating;
                recommlistratingInput.value = selectedRating;
            }

            fillStars(selectedRating);
        });
    });

    function fillStars(rating) {
        stars.forEach((star, i) => {
            if (i < rating) {
                star.classList.add("filled");
            } else {
                star.classList.remove("filled");
            }
        });
    }

    // Open and scroll to tab "Reviews" from top of page
    const openReviewsTab = document.querySelector('.details__info-rating');

    if (openReviewsTab) {
        openReviewsTab.addEventListener('click', function(event) {
            event.preventDefault();

            let reviewsTab = document.querySelector('.nav-tabs a[href="#details__reviews"]');
            let tabContent = document.getElementById('details__reviews');

            if (reviewsTab && tabContent) {
                new bootstrap.Tab(reviewsTab).show();
                tabContent.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
            }
        });
    }

});
