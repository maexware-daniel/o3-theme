document.addEventListener("DOMContentLoaded", () => {
    // Suche nach allen Buttons mit dem Attribut "data-js-noticelist"
    const buttons = document.querySelectorAll('button[data-js-noticelist]');

    buttons.forEach(button => {
        button.addEventListener('click', event => {
            event.preventDefault(); // Verhindert das Standard-Submit-Verhalten des Buttons

            // Hole das Formular anhand des Wertes im data-js-noticelist-Attribut
            const formId = button.dataset.jsNoticelist;
            const targetForm = document.getElementById(formId);

            // Überprüfen, ob das Formular gefunden wurde und absenden
            targetForm?.submit() || console.error(`Formular mit der ID "${formId}" wurde nicht gefunden.`);
        });
    });
});
