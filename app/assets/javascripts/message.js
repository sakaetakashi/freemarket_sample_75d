$(function(){
  function buildHTML(message) {
    var html = `<div class="one-message">
                  <div class="message-userName">
                    ${message.user_nickname}
                  </div>
                  <div class="speech-bubble">
                    <div class="message-text">
                      ${message.text}
                    </div>
                  </div>
                </div>`
      return html;
  }

  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax ({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done (function(data){
      var html = buildHTML(data);
      $('.comments').append(html);
      $('.textarea').val('');
      $('.form__submit').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
})