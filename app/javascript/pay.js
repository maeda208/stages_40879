window.addEventListener('turbo:load', function(){
  const form = document.getElementById('pay-form');
  const button = document.getElementById('pay-button');
  const payMessage = document.querySelector('.pay-message');

  if (button) {
    const applyId = button.dataset.applyId;  

    if (localStorage.getItem('buttonClickedPayment' + applyId)) {  
      button.style.display = 'none';
      payMessage.style.display = 'block';
    } else {
      form.addEventListener('submit', (e) => {
        e.preventDefault();
        button.style.display = 'none';
        payMessage.style.display = 'block';
        localStorage.setItem('buttonClickedPayment' + applyId, true);
        form.submit();
      });
    }
  }
});
