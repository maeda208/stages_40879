window.addEventListener('turbo:load', function() {
  document.querySelectorAll('.room__btn').forEach(button => {
    button.addEventListener('click', (event) => {
      event.preventDefault();

      // Send an AJAX request to the server
      fetch(button.href, {
        method: 'POST', // Use POST instead of GET
        headers: {
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
          'Accept': 'application/json'
        }
      })
      .then(response => response.json())
      .then(data => {
        // Hide the button and show the approval message
        button.style.display = 'none';
        const approvalMessage = button.nextElementSibling;
        approvalMessage.style.display = 'block';
      })
      .catch(error => {
        console.error('Error:', error);
      });
    });
  });
});