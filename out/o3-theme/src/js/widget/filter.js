// Hilfsfunktion für Debouncing
function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
        clearTimeout(timeout);
        timeout = setTimeout(() => func.apply(this, args), wait);
    };
}

// Toggle-Funktion mit besserer Parameterverwaltung
function toggleFilterValues(valuesWrapper, button, expand, userAction = false) {
    const valueNumber = parseInt(valuesWrapper.dataset.valueNumber, 10) || 10;
    const path = button.querySelector("path");

    if (expand) {
        valuesWrapper.style.maxHeight = "none";
        valuesWrapper.dataset.expanded = "true";
        if (userAction) valuesWrapper.dataset.userExpanded = "true";

        button.firstChild.nodeValue = `${button.dataset.langLess} `;
        if (path) path.setAttribute("d", "M1.875 6.75L5 4.25L8.125 6.75");
    } else {
        valuesWrapper.style.maxHeight = `${valueNumber * 40}px`;
        valuesWrapper.dataset.expanded = "false";
        if (userAction) valuesWrapper.dataset.userExpanded = "false";

        button.firstChild.nodeValue = `${button.dataset.langMore} `;
        if (path) path.setAttribute("d", "M1.875 4.25L5 6.75L8.125 4.25");
    }
}

// Zentrale Funktion für Filter-Button-Sichtbarkeit
function updateFilterButton(filterContainer) {
    const button = filterContainer.querySelector('[data-js="listing:filter-show-more"]');
    const valuesWrapper = filterContainer.querySelector('[data-js="listing:filter-values"]');

    if (!button || !valuesWrapper) return;

    const items = filterContainer.querySelectorAll('[data-js="listing:filter-item"], .form-check');
    const visibleItems = Array.from(items).filter(item => item.style.display !== "none");
    const valueNumber = parseInt(valuesWrapper.dataset.valueNumber, 10) || 10;
    const userExpanded = valuesWrapper.dataset.userExpanded === "true";
    const isExpanded = valuesWrapper.dataset.expanded === "true";

    if (visibleItems.length > valueNumber) {
        button.style.display = "";
        if (userExpanded) {
            toggleFilterValues(valuesWrapper, button, true);
        }
    } else {
        button.style.display = "none";
        if (!userExpanded && isExpanded) {
            toggleFilterValues(valuesWrapper, button, false);
        }
    }
}

// Suchfunktion für Filter-Items
function handleFilterSearch(searchInput) {
    const searchValue = searchInput.value.trim().toLowerCase();
    const filterContainer = searchInput.closest(".collapse");

    if (!filterContainer?.id) return;

    const items = filterContainer.querySelectorAll('[data-js="listing:filter-item"], .form-check');

    items.forEach(item => {
        const label = item.querySelector("label");
        if (!label) return;

        const text = label.textContent.trim().toLowerCase();
        item.style.display = !searchValue || text.includes(searchValue) ? "" : "none";
    });

    updateFilterButton(filterContainer);
}

// Debounced Version der Suchfunktion
const debouncedFilterSearch = debounce(handleFilterSearch, 150);

document.addEventListener('DOMContentLoaded', function() {
    const forms = document.querySelectorAll('[data-js="listing:filter"]');

    forms.forEach(form => {
        const isModal = form.closest('#offcanvas__filter') !== null;
        const selectedValues = {};

        // Event Delegation für Checkboxen
        form.addEventListener('change', function(e) {
            const checkbox = e.target;
            if (!checkbox.classList.contains('form-check-input')) return;

            const hiddenInput = checkbox.closest('.collapse')?.querySelector('input[type="hidden"]');
            if (!hiddenInput) return;

            const filterKey = hiddenInput.name;

            // Initialisiere Array falls nötig
            selectedValues[filterKey] = selectedValues[filterKey] || [];

            // Update selectedValues
            if (checkbox.checked) {
                if (!selectedValues[filterKey].includes(checkbox.value)) {
                    selectedValues[filterKey].push(checkbox.value);
                }
            } else {
                selectedValues[filterKey] = selectedValues[filterKey].filter(val => val !== checkbox.value);
            }

            // Sofortiges Submit nur für Nicht-Modal-Filter
            if (!isModal) {
                hiddenInput.value = selectedValues[filterKey].join(',');
                form.submit();
            }
        });

        // Submit-Button für Modal
        if (isModal) {
            const submitButton = document.querySelector('[data-js="listing:filter-apply"]');
            submitButton?.addEventListener('click', function() {
                Object.entries(selectedValues).forEach(([key, values]) => {
                    const hiddenInput = form.querySelector(`input[name="${key}"]`);
                    if (hiddenInput) {
                        hiddenInput.value = values.join(',');
                    }
                });
            });
        }
    });

    // Event Delegation für Suche (mit Debouncing)
    document.addEventListener("input", function(e) {
        if (!e.target.matches('[data-js="listing:filter-search"]')) return;
        debouncedFilterSearch(e.target);
    });

    // Event Delegation für Show More Buttons
    document.addEventListener("click", function(e) {
        const button = e.target.closest('[data-js="listing:filter-show-more"]');
        if (!button) return;

        const filterContainer = button.closest(".collapse");
        const valuesWrapper = filterContainer?.querySelector('[data-js="listing:filter-values"]');

        if (!valuesWrapper) return;

        const isExpanded = valuesWrapper.dataset.expanded === "true";
        toggleFilterValues(valuesWrapper, button, !isExpanded, true);
    });
});