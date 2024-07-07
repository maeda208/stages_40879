window.addEventListener('turbo:load', function(){
  const approvalButton = document.getElementById('approval-button');
  const approvalMessage = document.querySelector('.approval-message');
  if (approvalButton) {
  const applyId = approvalButton.dataset.applyId;  
  if (localStorage.getItem('approvalButtonClicked' + applyId)) {  
    approvalButton.style.display = 'none';
    if(approvalMessage) {
      approvalMessage.style.display = 'block';
    }
  } else {
    approvalButton.addEventListener('click', () => {
      approvalButton.style.display = 'none';
      if (approvalMessage) {
        approvalMessage.style.display = 'block';
      }
      localStorage.setItem('approvalButtonClicked' + applyId, true); 
    });
  }
}
});