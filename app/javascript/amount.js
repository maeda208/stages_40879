window.addEventListener('turbo:load', function(){
document.getElementById('transfer_amount').addEventListener('input', function() {
  var amount = this.value;
  var commission = amount * 0.1;
  document.getElementById('transfer_commission').value = commission;
});
});