document.addEventListener('DOMContentLoaded', function() {
    fetch('/fetch_symptoms')
        .then(response => response.json())
        .then(data => {
            const dropdown = document.getElementById('symptoms-dropdown'); 
            data.forEach(symptom => {
                const option = document.createElement('option');
                option.textContent = symptom; 
                dropdown.appendChild(option);
            });
        })
        .catch(error => console.error('Error fetching symptoms:', error)); 
});
