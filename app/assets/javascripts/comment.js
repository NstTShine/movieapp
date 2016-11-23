var comment = {
  initialize: function() {
    $('#btn_comment').click(function (event) {
      event.preventDefault();
      comment.save_comment();
    });
    $('body').on('click', 'a.link_delete', function(event) {
      event.preventDefault();
      var comment_id = $(this).data('comment-id');
      comment.delete_comment(comment_id);
      return false;
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
        $('#total_comments').html(parseInt($('#total_comments').html()) + 1);
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
          $('#total_comments').html(parseInt($('#total_comments').html()) - 1);
        });
      }
    });
  },

  load_comment_with_page: function (movie_id) {
    var movie_id = movie_id;
    $.get($('.pagination').attr('href'),
      {comment: movie_id}, function (data, status) {
      $('.page-link').html(data);
      return false;
    }, 'html');
  }
}
