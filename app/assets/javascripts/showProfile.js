$(document).on('turbolinks:load',function(){
  $(function() {
    $(".showPersonalViewModal").on("click", function(e){
      var imageId = $(this).data("id")
      $.ajax({
          type: "GET",
          url: "/createfoot",
          data: {"id": imageId},
          complete: function(){
            $(".js_click_hide").hide();
            $(".bg_overlay").fadeIn(300);
            $(".showProfile").each(function(){
              if ($(this).data("id") == imageId){
                $(this).fadeIn(800)
              }
            })
          }
      });
      e.preventDefault();
    });
    $(".modal_close").on("click", function(e){
      e.preventDefault();
      $(".bg_overlay").fadeOut(500);
      $(".showProfile").fadeOut(100);
    });
    $(".bg_overlay").on('click', function(e) {
      if (!$(e.target).closest('.showProfile').length) {
      $(".bg_overlay").fadeOut(500);
      $(".showProfile").fadeOut(100);
      }
    });
  });
})
