var comment = {
  initialize: function() {
    $('#btn_comment').click(function (event) {
      event.preventDefault();
      comment.save_comment();
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
      }
      $('#content_comment').val('');
    }, 'html');
  },

  delete_comment: function () {
    $('#link_delete').click(function(event){
      $.ajax({
        url: I18n.t('js.url_create_comment') + $('#movie_id').val() + "/comments/" + $('#comment_id').val(),
        type: 'DELETE',
        dataType: 'html',
        success: function(data, status){
          $('.comment-body').remove(data);
        }
      })
    });
  }
}
