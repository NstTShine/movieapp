var profile = {
  initialize: function(){
    var isHideAccountProfile = false;
    $('#account-profile').click(function() {
      $(this).data('clicked', true);
    });
    $("#account-picker-ava").click(function() {
      if (!$("#account-profile").is(':visible')) {
        $("#account-profile").show();
        $(".card-border-arrow").show();
        $(".card-border-arrow-backside").show();
      } else {
        $("#account-profile").hide();
        $(".card-border-arrow").hide();
        $(".card-border-arrow-backside").hide();
      }
      isHideAccountProfile = true;
    });
    $("#account-picker").click(function() {
      if($('#account-profile').data('clicked')) {
        isHideAccountProfile = true;
      }
    });
    $('body').click(function() {
      if ($("#account-profile").is(':visible') && !isHideAccountProfile) {
        $("#account-profile").hide();
        $(".card-border-arrow").hide();
        $(".card-border-arrow-backside").hide();
      }
      isHideAccountProfile = false;
    });
  }
}
