document.addEventListener('DOMContentLoaded', () => {
    'use strict';

    const forms = document.querySelectorAll('.needs-validation');

    Array.from(forms).forEach(form => {
        const password = form.querySelector('#userPassword');
        const confirmPassword = form.querySelector('#userPasswordConfirm');

        // ==========================================
        // PASSWORT-SPEZIFISCHE VALIDIERUNG (NEU)
        // ==========================================

        const passwordLengthInput = document.getElementById('passwordLength');
        const minLength = passwordLengthInput ? parseInt(passwordLengthInput.value, 10) : 12;

        // Elemente für Password-Validierung
        const passwordBar = form.querySelector('.component__password-bar');
        const passwordLabel = form.querySelector('.component__password-label');
        const requirements = form.querySelectorAll('.component__password-requirement');

        // Password Toggle Buttons
        const toggleButtons = form.querySelectorAll('[data-js="toggle-password"]');

        // Password Toggle Funktionalität
        toggleButtons.forEach(button => {
            button.addEventListener('click', () => {
                const targetId = button.getAttribute('data-target');
                const targetInput = form.querySelector(`#${targetId}`);

                if (targetInput) {
                    const isPassword = targetInput.type === 'password';
                    targetInput.type = isPassword ? 'text' : 'password';
                    button.setAttribute('aria-pressed', isPassword ? 'true' : 'false');

                    // Toggle SVGs
                    const svgs = button.querySelectorAll('svg');
                    if (svgs.length === 2) {
                        svgs[0].style.display = isPassword ? 'none' : 'block';
                        svgs[1].style.display = isPassword ? 'block' : 'none';
                    }
                }
            });
        });

        // Passwort-Kriterien prüfen
        const checkPasswordRequirements = (value) => {
            const checks = {
                length: value.length >= minLength,
                uppercase: /[A-Z]/.test(value),
                lowercase: /[a-z]/.test(value),
                number: /[0-9]/.test(value),
                special: /[!@#$%^&*()_+\-=\[\]{}|;:,.<>?/\\~]/.test(value)
            };

            let metCount = 0;

            // Anforderungen aktualisieren
            requirements.forEach(req => {
                const reqType = req.getAttribute('data-req');
                if (checks[reqType]) {
                    req.classList.add('is-met');
                    metCount++;
                } else {
                    req.classList.remove('is-met');
                }
            });

            return { checks, metCount };
        };

        // Passwort-Stärke aktualisieren
        const updatePasswordStrength = (metCount) => {
            // Alle Klassen entfernen
            passwordBar.classList.remove('is-weak', 'is-medium', 'is-strong');
            passwordLabel.classList.remove('is-weak', 'is-medium', 'is-strong');

            let strengthClass = '';
            let labelText = '';

            if (metCount === 0) {
                labelText = '';
            } else if (metCount < 4) {
                // Weniger als 4 von 5 Kriterien = Schwach
                strengthClass = 'is-weak';
                labelText = passwordLabel.getAttribute('data-label-weak') || 'Schwach';
            } else if (metCount === 4) {
                // Genau 4 von 5 Kriterien = Mittel
                strengthClass = 'is-medium';
                labelText = passwordLabel.getAttribute('data-label-medium') || 'Mittel';
            } else {
                // Alle 5 Kriterien erfüllt = Stark
                strengthClass = 'is-strong';
                labelText = passwordLabel.getAttribute('data-label-strong') || 'Stark';
            }

            if (strengthClass) {
                passwordBar.classList.add(strengthClass);
                passwordLabel.classList.add(strengthClass);
            }

            passwordLabel.textContent = labelText;
            passwordBar.setAttribute('aria-valuenow', metCount);
        };

        // Custom Validity für Passwort-Anforderungen
        const validatePasswordRequirements = (value) => {
            if (!value) {
                // Leeres Feld - HTML5 required-Attribut übernimmt
                password.setCustomValidity('');
                return;
            }

            const { checks } = checkPasswordRequirements(value);
            const allMet = Object.values(checks).every(check => check === true);

            if (!allMet) {
                password.setCustomValidity(' ');
            } else {
                password.setCustomValidity('');
            }
        };

        // Event Listener für Passwort-Eingabe (nur wenn Elemente vorhanden)
        if (password && passwordBar && passwordLabel && requirements.length > 0) {
            password.addEventListener('input', () => {
                const { metCount } = checkPasswordRequirements(password.value);
                updatePasswordStrength(metCount);
                validatePasswordRequirements(password.value);

                // Bestätigungsfeld auch prüfen, falls bereits ausgefüllt
                if (confirmPassword && confirmPassword.value) {
                    if (password.value !== confirmPassword.value) {
                        confirmPassword.setCustomValidity(' ');
                    } else {
                        confirmPassword.setCustomValidity('');
                    }
                }
            });
        }

        // ==========================================
        // URSPRÜNGLICHE BOOTSTRAP-VALIDIERUNG
        // ==========================================

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

        // Überprüfung bei Formular-Übermittlung
        form.addEventListener('submit', event => {

            // Passwort-Anforderungen prüfen (nur wenn Passwort-Feld existiert)
            if (password) {
                validatePasswordRequirements(password.value);
            }

            // Passwort-Übereinstimmung prüfen (nur wenn beide Felder existieren)
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
    });
});