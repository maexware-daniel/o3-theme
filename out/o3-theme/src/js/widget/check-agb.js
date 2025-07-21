document.addEventListener('DOMContentLoaded', function() {
    function checkboxListener(checkboxId, inputName) {
        const checkbox = document.getElementById(checkboxId);
        if (checkbox) {
            checkbox.addEventListener('change', function() {
                const inputFields = document.querySelectorAll(`input[name="${inputName}"]`);
                inputFields.forEach(function(inputField) {
                    inputField.value = checkbox.checked ? '1' : '0';
                });
            });
        }
    }

    checkboxListener('checkAgbTop', 'ord_agb');
    checkboxListener('oxdownloadableproductsagreement', 'oxdownloadableproductsagreement');
    checkboxListener('oxserviceproductsagreement', 'oxserviceproductsagreement');
});
