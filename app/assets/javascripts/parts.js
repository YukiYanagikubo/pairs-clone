$(document).on('turbolinks:load',function(){
  $(function() {
    //非表示設定解除時
    $("#cancel_dislike_button").on("click", function(e){
      e.preventDefault();
      $(".bg_overlay").fadeIn(300);
      $(".box_modal_window").fadeIn(800)
    });
    //ポップアップの閉じる動作（閉じるボタン）
    // $(".modal-ok").on("click", function(e){
    //   e.preventDefault();
    //   $(".bg_overlay").fadeOut(300);
    //   $(".box_modal_window").fadeOut(800);
    // });
    //非表示・ブロックの設定ポップアップ
    $("#appear_setting").on("click", function(e){
      e.preventDefault();
      $(".bg_overlay").fadeIn(300);
      $("#top_modal").fadeIn(800)
    });
    //上記のポップアップ、設定ボタン押下後
    $("#setting").on("click", function(e){
      e.preventDefault();
      $(".bg_overlay").fadeIn(300);
      $(".hide_complete").fadeIn(800)
    });
    //一人のプロフィール、『設定』ボタンからのポップアップ
    $(function() {
      $("#button_setting").click(function(){
        $(".box_custom_display_form").toggle();
      });
    });
    // 右上アイコンクリックによるポップアップ表示
    $(function() {
      $("#header_logo").click(function(){
        console.log(this);
        $("#box_header_message").toggle();
      });
    });
    // 右上アイコンクリックによるアイコン色変化
    $(function(){
      $(".notifCentered_messeage").click(function(){
        if($(this).attr("class")=="notifCentered_messeage"){
          $(this).removeClass("notifCentered_messeage").addClass("notifCentered_messeage is_active");
        }else{
          $(this).removeClass("notifCentered_messeage is_active").addClass("notifCentered_messeage");
        }
      });
    });
  });
})
