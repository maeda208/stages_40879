window.addEventListener('turbo:load', function(){
  const participateButton = document.getElementById('participate-button');
  const participateMessage = document.querySelector('.participate-message');
  if (participateButton) {
  const userId = participateButton.dataset.userId;  
  const stageId = participateButton.dataset.stageId;
  if (localStorage.getItem(`participateButtonClicked_${stageId}_${userId}`)) {  
    participateButton.style.display = 'none';
    if(participateMessage) {
      participateMessage.style.display = 'block';
    }
  } else {
    participateButton.addEventListener('click', () => {
      participateButton.style.display = 'none';
      if (participateMessage) {
        participateMessage.style.display = 'block';
      }
      localStorage.setItem(`participateButtonClicked_${stageId}_${userId}`, true); 
    });
  }
}
});