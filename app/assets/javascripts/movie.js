var movie = {
  initialize: function(){
    movie.rate_click = -1;
    if($('#your_rate').val() !== ''){
      movie.rate_click = $('#your_rate').val() - 1;
      movie.display_star_effect(movie.rate_click);
    };
    $('.star-movie').each(function(index){
      $(this).click(function(){
        movie.rate_click = index;
        movie.display_star_effect(index);
        movie.on_click_rate();
      });
      $(this).hover(function(){
        movie.display_star_effect(index);
      });
    });
    $('.rate-movie').hover(function(){}, function(){
      movie.display_star_effect(movie.rate_click);
    });
  },

  display_star_effect: function(index){
    for(var i = 0; i <= index; i++){
      $($('.star-movie')[i]).attr('src', '/assets/star-on.png');
    }
    for(var i = index + 1; i < 5; i++){
      $($('.star-movie')[i]).attr('src', '/assets/star-off.png');
    }
  },

  on_click_rate: function(){
    var rating_params = {};
    rating_params.rating = movie.rate_click + 1;
    rating_params.movie_id = $('#movie_id_field').val();
    if($('#your_rate_id').val() === ""){
      $.post(I18n.t('js.url_update_rating'),
        {rating_params: rating_params},
      'json')
      .done(function(data, status){
        $('#rate-star').html(data.rating.toFixed(1));
        $('#rate_text').html(data.rating.toFixed(1));
        $('#total_rater').html(parseInt($('#total_rater').html()) + 1);
        $('#your_rate_id').val(data.id);
      })
      .fail(function(data, status){
        var res = jQuery.parseJSON(data.responseText);
        alert(res.notice);
      });
    } else {
      $.ajax({
        url: I18n.t('js.url_update_rating') + '/' + $('#your_rate_id').val(),
        type: 'PUT',
        dataType: 'json',
        data: {
          rating_params: rating_params
        },
        success: function(data, status){
          $('#rate-star').html(data.rating.toFixed(1));
          $('#rate_text').html(data.rating.toFixed(1));
        }
      })
    }
  }
}
