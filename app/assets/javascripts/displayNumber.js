$(document).on('turbolinks:load',function(){
  $(function() {
    $("#selected_value").on("change", function(e){
      e.preventDefault();
      $(this).parents("form").submit();
    });
  });
})

