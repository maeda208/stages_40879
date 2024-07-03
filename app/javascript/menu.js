window.addEventListener('turbo:load', function(){
  const button = document.getElementById('approval-button');
  const approvalMessage = document.querySelector('.approval-message');
  if (button) {
  const applyId = button.dataset.applyId;  // add this line to get the user ID
  // Check if the event has already been triggered for this user
  if (localStorage.getItem('buttonClicked' + applyId)) {  // modify this line to include the user ID
    // If so, hide button and show message immediately
    if (button) {
      button.style.display = 'none';
    }
    if(approvalMessage) {
      approvalMessage.style.display = 'block';
    }
  } else if(button) {
    // If not, add the event listener
    button.addEventListener('click', () => {
      button.style.display = 'none';
      if (approvalMessage) {
        approvalMessage.style.display = 'block';
      }
      // Store that the event has been triggered in local storage, for this user
      localStorage.setItem('buttonClicked' + applyId, true);  // modify this line to include the user ID
    });
  }
}
});