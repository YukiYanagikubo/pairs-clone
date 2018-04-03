$(document).on('turbolinks:load',function(){
  $(function() {
    //コミュニティとは？からのポップアップ
    $(".link_help").on("click", function(e){
      e.preventDefault();
      $(".bg_overlay").fadeIn(300);
      $(".box_modal_window").fadeIn(800)
    });
    //ポップアップの閉じる動作（バツボタン）
    $(".modal_close").on("click", function(e){
      e.preventDefault();
      $(".bg_overlay").fadeOut(500);
      $(".box_modal_window").fadeOut(100);
    });
    //ポップアップの閉じる動作（いいえボタン）
    $(".modal-close").on("click", function(e){
      e.preventDefault();
      $(".bg_overlay").fadeOut(500);
      $(".box_modal_window").fadeOut(100);
    });
    //ポップアップの閉じる動作（バツボタン以外）
    $(".bg_overlay").on('click', function(e) {
      if (!$(e.target).closest('.box_modal_window').length) {
      $(".bg_overlay").fadeOut(500);
      $(".box_modal_window").fadeOut(100);
      }
    });
    //selectを変更のみで、検索する
    $("#selected_value").on("change", function(e){
      e.preventDefault();
      $(this).parents("form").submit();
    });
    //詳細ページでの削除ポップアップ表示
    $("#unsubscribe").on("click", function(e){
      e.preventDefault();
      $(".bg_overlay").fadeIn(300);
      $("#modal_comunity_leave").fadeIn(800)
    });
    //詳細ページでの作成ポップアップ表示
    $("#entry").on("click", function(e){
      e.preventDefault();
      $(".bg_overlay").fadeIn(300);
      $("#modal_comunity_join").fadeIn(800)
    });

  });
})
