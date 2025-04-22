document.addEventListener('DOMContentLoaded', () => {
    'use strict';

    const forms = document.querySelectorAll('.needs-validation');

    Array.from(forms).forEach(form => {
        const password = form.querySelector('#userPassword');
        const confirmPassword = form.querySelector('#userPasswordConfirm');

        // Überprüfung bei Formular-Übermittlung
        form.addEventListener('submit', event => {

            if (password && confirmPassword) {
                if (password.value !== confirmPassword.value) {
                    confirmPassword.setCustomValidity(' '); // Markiert als ungültig
                } else {
                    confirmPassword.setCustomValidity(''); // Setzt als gültig, falls Passwörter übereinstimmen
                }
            }

            // Formular-Validierungsstatus prüfen
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }

            form.classList.add('was-validated');
        }, false);

        // Echtzeit-Überprüfung bei Eingabe im Bestätigungsfeld
        if (password && confirmPassword) {
            confirmPassword.addEventListener('input', () => {
                if (password.value !== confirmPassword.value) {
                    confirmPassword.setCustomValidity(' ');
                } else {
                    confirmPassword.setCustomValidity('');
                }
            });
        }
    });
});
