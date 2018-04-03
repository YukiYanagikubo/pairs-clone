//女性用
$(document).on('turbolinks:load',function(){
  $(function() {
    $("#female_gnavi_item").on("click", function(e){
      e.preventDefault();
      $(".bg_overlay").fadeIn(300);
      $("#box_offline_female").fadeIn(800)
    });
    $(".modal_close").on("click", function(e){
      e.preventDefault();
      $(".bg_overlay").fadeOut(500);
      $("#box_offline_female").fadeOut(100);
    });
    $(".bg_overlay").on('click', function(e) {
      if (!$(e.target).closest('#box_offline_female').length) {
      $(".bg_overlay").fadeOut(500);
      $("#box_offline_female").fadeOut(100);
      }
    });
  });
})

//男性用
$(document).on('turbolinks:load',function(){
  $(function() {
    $("#male_gnavi_item").on("click", function(e){
      e.preventDefault();
      $(".bg_overlay").fadeIn(300);
      $("#box_offline_male").fadeIn(800)
    });
    $(".modal_close").on("click", function(e){
      e.preventDefault();
      $(".bg_overlay").fadeOut(500);
      $("#box_offline_male").fadeOut(100);
    });
    $(".bg_overlay").on('click', function(e) {
      if (!$(e.target).closest('#box_offline_male').length) {
      $(".bg_overlay").fadeOut(500);
      $("#box_offline_male").fadeOut(100);
      }
    });
  });
})
