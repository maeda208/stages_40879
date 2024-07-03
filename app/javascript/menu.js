window.addEventListener('turbo:load', function() {
  console.log("menu.js loaded"); 
  const button = document.getElementById('approval-button');

  // Check if button exists
  if (button) {
    button.addEventListener('click', () => {
        button.style.display = 'none';
    });
  } else {
    console.error('Could not find button');
  }
});
