function initProductSlider(listId) {
    let splide = new Splide(`.component__productslider-${listId}`);
    let bar = splide.root.querySelector('.splide__progress-bar');

    splide.on('mounted move', function () {
        let end = splide.Components.Controller.getEnd() + 1;
        let rate = Math.min((splide.index + 1) / end, 1);
        bar.style.width = `${100 * rate}%`;
    });

    splide.mount();
}