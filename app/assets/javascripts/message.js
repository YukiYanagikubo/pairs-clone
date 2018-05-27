$(function() {
  function messagesHTML(message){
    if (message.user_id){
    var html =
      `<div class='list_message' data-id=${message.id}>
        <p class='hr_date'>${message.date}</p>
        <div class='you_message'>
          <div class='box_message_info'>
            <p class='message_text'>${message.content}</p>
            <p class='message_already_read'>既読</p>
            <p class='message_send_time'>${message.date}</p>
          </div>
        </div>
      </div>`
    }else {
      var html =
      `<div class='list_message' data-id=${message.id}>
        <p class='hr_date'>${message.date}</p>
        <div class='their_message'>
          <div class='box_message_info'>
            <p class='message_user_name'>${message.user_name}</p>
            <p class='message_text'>${message.content}</p>
            <p class='message_send_time'>${message.date}</p>
          </div>
        </div>
      </div>`
    }
        return html;
  }

  function messagesHTML2(message){
    var html2 =
    `<div class='list_message' data-id=${message.id}>
      <p class='hr_date'>${message.date}</p>
      <div class='their_message'>
        <div class='box_message_info'>
          <p class='message_user_name'>${message.user_name}</p>
          <p class='message_text'>${message.content}</p>
          <p class='message_send_time'>${message.date}</p>
        </div>
      </div>
    </div>`
    return html2;
  }

  $("#new_message").on('submit',function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = messagesHTML(data);
      $(".messages_dates").append(html);
      $("#message_content").val('')
    })
    .fail(function(){
      alert('error')

    });
    return false;
  });

// 自動更新
      var interval = setInterval(function(){
      // 正規表現でURLに一致しないページで自動更新しないよう分岐
      if (location.href.match(/\/groups\/\d+\/messages/)){
        var message_id = $('.list_message:last').data('id')
    $.ajax({
      url: location.href,
      type: 'GET',
      data: { message: { id: message_id } },
      dataType: 'json'
    })
    .done(function(new_messages){
      $.each(new_messages,function(i,new_message){
        var html2 = messagesHTML2(new_message)
        $('.messages_dates').append(html2)
        $("#message_scroll").animate({scrollTop: $("#message_scroll")[0].scrollHeight}, 500, 'swing');
      })
    })
    .fail(function() {
      alert('自動更新失敗');
    });
  } else {
    clearInterval(interval);
  }} , 5000 );
});
