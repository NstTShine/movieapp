var comment = {
  initialize: function() {
    $('#btn_comment').click(function (event) {
      event.preventDefault();
      comment.save_comment();
    });
    $('.link_delete').each(function(){
      $(this).click(function(event) {
        event.preventDefault();
        var comment_id = $(this).data('comment-id');
        comment.delete_comment(comment_id);
      });
    });

    $('.pagination').each(function () {
      $(this).on('click', function (event) {
        event.preventDefault();
        var movie_id = $('#movie_id').val();
        comment.load_comment_with_page(movie_id);
      });
    });
  },
  save_comment: function() {
   var comment_params = {};
   comment_params.movie_id = $('#movie_id').val();
   comment_params.content = $('#content_comment').val();
   $.post(I18n.t('js.url_create_comment') + $('#movie_id').val() + "/comments",
    {comment: comment_params},
    function(data, status) {
      if (data == 'false') {
        alert(I18n.t('js.can_not_save_comment'))
      } else {
        $('.comment-body').prepend(data);
        $('#link_delete').click(function(event) {
          event.preventDefault();
          var comment_id = $(this).data('comment-id');
          comment.delete_comment(comment_id);
        });
      }
      $('#content_comment').val('');
    }, 'html');
  },

  delete_comment: function (comment_id) {
    $.ajax({
      url: I18n.t('js.url_create_comment') + $('#movie_id').val() + "/comments/"
        + comment_id,
      type: 'DELETE',
      data: {},
      dataType: 'html',
      success: function() {
        $('#comment-' + comment_id).fadeOut(500, function() {
          $(this).remove();
        });
      }
    });
  },

  load_comment_with_page: function (movie_id) {
    $.get($('.pagination').attr('href'),
      {params: movie_id}, function (data, status) {
      $('#comment-body').html(data);
      return false;
    }, 'html');
  }
}
