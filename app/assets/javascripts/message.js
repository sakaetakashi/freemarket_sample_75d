$(function(){
  function buildHTML(message) {
    var html = `<div class="one-message" data-message-id=${message.id}>
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

  var reloadMessages = function() {
    var last_message_id = $('.one-message:last').data("message-id");
    let product_id = $(".commentBox").attr("id")
    $.ajax({
      url: `${product_id}/api/messages`, 
      type: 'get',
      dataType: 'json',
      data: {id: last_message_id}
    })
    .done(function(messages){
      if (messages.length !== 0) {
      var insertHTML = '';
      $.each(messages, function(i, message) {
        insertHTML += buildHTML(message)
      })
      $('.comments').append(insertHTML);
      $('.comments').animate({ scrollTop: $('.comments')[0].scrollHeight});
    }
    })
    .fail(function() {
      alert('errors');
    });
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
      alert('エラー');
    })
  })
  if (document.location.href.match(/\/products\/\d+$/)) {
    setInterval(reloadMessages, 7000);
  } 
})