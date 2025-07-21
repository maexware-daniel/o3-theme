document.addEventListener('DOMContentLoaded', function() {
    const forms = document.querySelectorAll('[data-js="alist__filter"]'); // Alle Formulare mit dem gleichen Selektor erfassen

    forms.forEach(form => {
        const isModal = form.closest('#offcanvas__filter') !== null; // Prüfen, ob das Formular im Modal ist
        const checkboxes = form.querySelectorAll('.form-check-input');
        let selectedValues = {};

        // Checkbox-Event-Listener
        checkboxes.forEach(function(checkbox) {
            checkbox.addEventListener('change', function() {
                const filterKey = checkbox.closest('.collapse').querySelector('input[type="hidden"]').name;

                // Initialisiere das Array für den Filter, falls noch nicht vorhanden
                selectedValues[filterKey] = selectedValues[filterKey] || [];

                if (checkbox.checked) {
                    selectedValues[filterKey].push(checkbox.value);
                } else {
                    // Entferne den Wert, falls die Checkbox deaktiviert wird
                    selectedValues[filterKey] = selectedValues[filterKey].filter(val => val !== checkbox.value);
                }

                // Nur für den Standardfilter sofort submitten
                if (!isModal) {
                    // Aktualisiere das versteckte Input-Feld und sende das Formular
                    const hiddenInput = form.querySelector(`input[name="${filterKey}"]`);
                    if (hiddenInput) {
                        hiddenInput.value = selectedValues[filterKey].join(',');
                    }
                    form.submit();
                }
            });
        });

        // Event-Listener für den Bestätigungsbutton im Modal
        if (isModal) {
            const submitButton = document.querySelector('[data-js="alist__filter-apply"]');
            submitButton.addEventListener('click', function() {
                // Setze die versteckten Input-Felder mit den gesammelten Werten
                Object.keys(selectedValues).forEach(key => {
                    const hiddenInput = form.querySelector(`input[name="${key}"]`);
                    if (hiddenInput) {
                        hiddenInput.value = selectedValues[key].join(',');
                    }
                });
            });
        }
    });
});
