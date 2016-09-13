$(document).ready(function() {
  $("#main-form").on("submit", function(e){
    e.preventDefault();
    $('.title').text('Calculating...')
    $form = $(this)
    data = $(this).serialize();
    console.log(data);
    $.post( "/calculate", data )
      .done(function( response ) {
        $('.title').text("CopyCat Gaming")
        $('#main-form').trigger("reset");
        $("#results").html(response).slideDown(2000);
      });
    });
});
