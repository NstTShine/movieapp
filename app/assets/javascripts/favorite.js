var favorite = {
  initialize: function(){
    $('#like').click(function (event){
      event.preventDefault();
      $(this).hide();
      $('#unlike').show();
    });
    $('#unlike').click(function(event){
      event.preventDefault();
      $(this).hide();
      $('#like').show();
    });
  }
}
