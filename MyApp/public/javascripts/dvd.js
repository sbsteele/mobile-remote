$(function(){
  $( ".cmd" ).click(function() {
    alert( "Handler called cmd = " + $( this ).attr( "id" ));
    $.post( "/", { cmd: $ (this).attr( "id" ) });
  });
});
