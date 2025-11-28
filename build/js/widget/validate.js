document.addEventListener('DOMContentLoaded', () => {
    'use strict';

    const forms = document.querySelectorAll('.needs-validation');

    Array.from(forms).forEach(form => {
        const password = form.querySelector('#userPassword');
        const confirmPassword = form.querySelector('#userPasswordConfirm');

        // ==========================================
        // PASSWORD-SPECIFIC VALIDATION
        // ==========================================

        const passwordLengthInput = document.getElementById('passwordLength');
        const minLength = passwordLengthInput ? parseInt(passwordLengthInput.value, 10) : 12;

        // Elements for password validation
        const passwordBar = form.querySelector('.component__password-bar');
        const passwordLabel = form.querySelector('.component__password-label');
        const requirements = form.querySelectorAll('.component__password-requirement');

        // Password Toggle Buttons
        const toggleButtons = form.querySelectorAll('[data-js="toggle-password"]');

        // Password toggle functionality
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

        // Check password criteria
        const checkPasswordRequirements = (value) => {
            const checks = {
                length: value.length >= minLength,
                uppercase: /[A-Z]/.test(value),
                lowercase: /[a-z]/.test(value),
                number: /[0-9]/.test(value),
                special: /[!@#$%^&*()_+\-=\[\]{}|;:,.<>?/\\~]/.test(value)
            };

            let metCount = 0;

            // Update requirements
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

        // Update password strength
        const updatePasswordStrength = (metCount) => {

            passwordBar.classList.remove('is-weak', 'is-medium', 'is-strong');
            passwordLabel.classList.remove('is-weak', 'is-medium', 'is-strong');

            let strengthClass = '';
            let labelText = '';

            if (metCount === 0) {
                labelText = '';
            } else if (metCount < 4) {
                // Less than 4 out of 5 criteria = Weak
                strengthClass = 'is-weak';
                labelText = passwordLabel.getAttribute('data-label-weak') || 'Schwach';
            } else if (metCount === 4) {
                // Exactly 4 out of 5 criteria = Average
                strengthClass = 'is-medium';
                labelText = passwordLabel.getAttribute('data-label-medium') || 'Mittel';
            } else {
                // All 5 criteria met = Strong
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

        // Custom Validity for Password Requirements
        const validatePasswordRequirements = (value) => {
            if (!value) {
                // Empty field - HTML5 required attribute takes over
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

        // Event listener for password entry (only if elements are present)
        if (password && passwordBar && passwordLabel && requirements.length > 0) {
            password.addEventListener('input', () => {
                const { metCount } = checkPasswordRequirements(password.value);
                updatePasswordStrength(metCount);
                validatePasswordRequirements(password.value);

                // Also check the confirmation field if it has already been filled in.
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
        // BOOTSTRAP VALIDATION
        // ==========================================

        // Real-time verification when entering data in the confirmation field
        if (password && confirmPassword) {
            confirmPassword.addEventListener('input', () => {
                if (password.value !== confirmPassword.value) {
                    confirmPassword.setCustomValidity(' ');
                } else {
                    confirmPassword.setCustomValidity('');
                }
            });
        }

        // Verification upon form submission
        form.addEventListener('submit', event => {

            // Check password requirements (only if password field exists)
            if (password) {
                validatePasswordRequirements(password.value);
            }

            // Check password match (only if both fields exist)
            if (password && confirmPassword) {
                if (password.value !== confirmPassword.value) {
                    confirmPassword.setCustomValidity(' '); // Marked as invalid
                } else {
                    confirmPassword.setCustomValidity(''); // Set as valid if passwords match
                }
            }

            // Check form validation status
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }

            form.classList.add('was-validated');
        }, false);
    });
});