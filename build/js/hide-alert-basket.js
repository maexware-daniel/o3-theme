const offcanvasBasket = document.getElementById('offcanvas__basket');
if (offcanvasBasket) {
    offcanvasBasket.addEventListener('hidden.bs.offcanvas', event => {
        const alert = document.querySelector('.alert-success');
        if (alert) {
            alert.remove();
        }
    });
}

