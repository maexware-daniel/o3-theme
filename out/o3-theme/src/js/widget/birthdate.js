document.addEventListener('DOMContentLoaded', function() {
    const birthdateInput = document.querySelector('[data-js="birthdate"]');
    const dayInput = document.querySelector('[data-js="birthdate-day"]');
    const monthInput = document.querySelector('[data-js="birthdate-month"]');
    const yearInput = document.querySelector('[data-js="birthdate-year"]');

    birthdateInput.addEventListener('change', () => {
        const birthdate = new Date(birthdateInput.value);

        if (!isNaN(birthdate.getTime())) {
            dayInput.value = String(birthdate.getDate()).padStart(2, '0');
            monthInput.value = String(birthdate.getMonth() + 1).padStart(2, '0');
            yearInput.value = birthdate.getFullYear();
        } else {
            // Falls das Datum ungültig ist, werden die versteckten Felder geleert
            dayInput.value = "";
            monthInput.value = "";
            yearInput.value = "";
        }
    });
});