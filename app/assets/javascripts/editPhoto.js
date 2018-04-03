$(document).on('turbolinks:load',function(){
  $(function() {
    $(".button_edit").on("click", function(e){
      $(".bg_overlay").fadeIn(300);
      $("#modal_edit_photo").fadeIn(300);
      e.preventDefault();
    });
    $(".modal_close").on("click", function(e){
      e.preventDefault();
      $(".bg_overlay").fadeOut(500);
      $("#modal_edit_photo").fadeOut(100);
    });
    $(".bg_overlay").on('click', function(e) {
      e.preventDefault();
      if (!$(e.target).closest('#modal_edit_photo').length) {
      $(".bg_overlay").fadeOut(500);
      $("#modal_edit_photo").fadeOut(100);
      }
    });
  });
})
