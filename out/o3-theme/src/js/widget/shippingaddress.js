document.addEventListener('DOMContentLoaded', function() {

    // Liefert den richtigen reloadaddress-Wert
    function getReloadValue(selectValue) {
        return selectValue === '-1' ? '1' : '2';
    }

    // Entfernt die Edit- und Delete-Buttons innerhalb von .user__shippingaddress-change
    function removeButtons() {
        const shippingForm = document.querySelector('.user__shippingaddress-change');
        if (shippingForm) {
            shippingForm.querySelectorAll('.btn-edit, .btn-delete').forEach(button => button.remove());
        }
    }

    function setNewAddress() {

        // Umschalten des disabled-Status
        const formElements = document.querySelectorAll('.user__shippingaddress-form input, .user__shippingaddress-form select');
        formElements.forEach(item => item.toggleAttribute('disabled'));

        // Entfernen der Buttons .btn-edit und .btn-delete innerhalb von .user__shippingaddress-change
        removeButtons();

        // Country und State Selects zurücksetzen
        const countrySelect = document.querySelector("select[name='deladr[oxaddress__oxcountryid]']");
        const stateSelect = document.querySelector("select[name='deladr[oxaddress__oxstateid]']");

        if (countrySelect) countrySelect.value = "";
        if (stateSelect) stateSelect.value = "";
    }

    // Setzt Formularwerte und sendet das Formular ab
    function submitForm() {
        const orderForm = document.querySelector("form[name='order']");
        const changeClassValue = document.querySelector("input[name='changeClass']").value;

        orderForm.querySelector("input[name='cl']").value = changeClassValue;
        orderForm.querySelector("input[name='fnc']").value = '';
        orderForm.submit();
    }

    // Event-Listener für das Ändern der Lieferadresse
    const addressSelect = document.querySelectorAll("input[name='oxaddressid']");
    const addressEmpty = document.querySelector("#user__shippingaddress-change");

    if(addressSelect.length !== 0) {
        addressSelect.forEach(select => {
            select.addEventListener('change', function() {
                const selectValue = this.value;
                const reloadAddressInput = document.querySelector("input[name='reloadaddress']");

                if (reloadAddressInput) {
                    reloadAddressInput.value = getReloadValue(selectValue);
                }

                if (selectValue !== '-1') {
                    // Formularvalidierung deaktivieren und Formular verstecken
                    /*
                    document.querySelectorAll('.js-oxValidate').forEach(element => {
                        element.removeEventListener('submit', function() {});
                    });
                    */

                    submitForm();
                } else {
                    setNewAddress();
                }
            });
        });
    } else {
        addressEmpty.addEventListener('show.bs.collapse', function() {
            setNewAddress();
        });
        addressEmpty.addEventListener('hidden.bs.collapse', function() {
            setNewAddress();
        });
    }

});
