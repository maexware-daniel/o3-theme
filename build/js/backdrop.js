const megaDropdowns = document.querySelectorAll('.mega-dropdown');
const mainElement = document.querySelector('main');

megaDropdowns.forEach(dropdown => {
    dropdown.addEventListener('mouseenter', () => {
        mainElement.classList.add('backdrop');
    });
    dropdown.addEventListener('mouseleave', () => {
        mainElement.classList.remove('backdrop');
    });
});