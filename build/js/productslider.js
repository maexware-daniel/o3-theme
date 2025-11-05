function initProductSlider(element, listId) {
    let splide = new Splide(element);
    let bar = element.querySelector('.splide__progress-bar');

    splide.on('mounted move', function () {
        let end = splide.Components.Controller.getEnd() + 1;
        let rate = Math.min((splide.index + 1) / end, 1);
        bar.style.width = `${100 * rate}%`;
    });

    splide.mount();
}

function initAllProductSliders() {
    document.querySelectorAll('[class*="component__productslider-"][data-list-id]').forEach(element => {
        const listId = element.dataset.listId;
        initProductSlider(element, listId);
    });
}

document.addEventListener('DOMContentLoaded', initAllProductSliders);

window.initAllProductSliders = initAllProductSliders;