// Update the state of the buttons based on current value
function updateButtons(inputField, minusButton, plusButton) {
    const currentValue = parseFloat(inputField.value);
    const min = parseFloat(inputField.getAttribute('min')) || 1;
    const max = parseFloat(inputField.getAttribute('max')) || Infinity;

    // Minus button disable logic
    if (currentValue <= min) {
        minusButton.setAttribute('disabled', 'disabled');
    } else {
        minusButton.removeAttribute('disabled');
    }

    // Plus button disable logic
    if (currentValue >= max) {
        plusButton.setAttribute('disabled', 'disabled');
    } else {
        plusButton.removeAttribute('disabled');
    }
}

// Modify the input value by attribute "step"
function modifyValue(inputField, change) {
    let currentValue = parseFloat(inputField.value);
    const step = inputField.getAttribute('step') === 'any' ? 1 : parseFloat(inputField.getAttribute('step')) || 1;

    // Calculate new value
    let newValue = currentValue + change * step;

    const min = parseFloat(inputField.getAttribute('min')) || 1;
    const max = parseFloat(inputField.getAttribute('max')) || Infinity;

    // Apply min and max boundaries
    newValue = Math.max(newValue, min);
    newValue = Math.min(newValue, max);

    // Set the new value
    inputField.value = newValue.toFixed(step === 1 ? 0 : 1);
}

// Schedule form submission with delay if form[data-js="tobasket-change"]
let submitTimeout;
function scheduleSubmit(form) {
    if (form) {
        // Clear any existing timeout to avoid rapid submits
        clearTimeout(submitTimeout);

        // Set a new timeout to submit the form after a delay (e.g., 500ms)
        submitTimeout = setTimeout(function () {
            form.submit();
        }, 500); // Adjust the delay (500ms) as needed
    }
}

document.querySelectorAll('[data-js="tobasket"]').forEach(function (basket) {
    const minusButton = basket.querySelector('[data-js="tobasket-minus"]');
    const plusButton = basket.querySelector('[data-js="tobasket-plus"]');
    const inputField = basket.querySelector('[data-js="tobasket-input"]');
    const form = basket.closest('form[data-js="tobasket-change"]');

    // Event listener for minus button
    minusButton.addEventListener('click', function () {
        modifyValue(inputField, -1);
        updateButtons(inputField, minusButton, plusButton);
        scheduleSubmit(form);
    });

    // Event listener for plus button
    plusButton.addEventListener('click', function () {
        modifyValue(inputField, 1);
        updateButtons(inputField, minusButton, plusButton);
        scheduleSubmit(form);
    });

    // Event listener for manual input change
    inputField.addEventListener('input', function () {
        const value = parseFloat(inputField.value);
        if (isNaN(value)) {
            inputField.value = 1; // Set default value if input is invalid
        }
        updateButtons(inputField, minusButton, plusButton);
        scheduleSubmit(form);
    });
});
