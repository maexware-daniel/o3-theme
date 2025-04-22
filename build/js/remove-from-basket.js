function setRemoveValue(button) {

    const inputField = button.previousElementSibling;

    if (inputField && inputField.tagName === 'INPUT' && inputField.type === 'hidden') {
        inputField.value = "1";
    }
}

document.querySelectorAll("[data-js='remove-from-basket']").forEach(button => {
    button.addEventListener("click", function(event) {
        setRemoveValue(button);
    });
});
