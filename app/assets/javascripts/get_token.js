$(window).load(function() {
  var token = window.location.hash.substr(1).split('=')[1];
  console.log("Token =======>" + token);
  $.ajax({
    method: "POST",
    url: '/add_token_to_user',
    data: {token: token},
    success: function(data) {
      data = JSON.parse(data)
      console.log("Status:" + data.status)
    }
  });
});
