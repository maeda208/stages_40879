window.addEventListener('turbo:load', function(){
  document.addEventListener("DOMContentLoaded", function() {
    var submitButton = document.getElementById("submit-button");
    var form = document.getElementById("stage-form");
  
    submitButton.addEventListener("click", function(event) {
      event.preventDefault(); // フォームの自動送信を防ぐ
  
      var userConfirmed = confirm("変更しますか？");
  
      if (userConfirmed) {
        form.submit(); // ユーザーが確認した場合にフォームを送信
      }
    });
  });
  
});