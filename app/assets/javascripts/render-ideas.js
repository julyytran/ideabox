$(document).ready(function () {
  renderIdeas();
})

function renderIdeas () {
  $.getJSON( "/api/v1/ideas", function(data) {
    for (var i = 0; i < data.length; i++) {
      $('#ideas-list').append("<li class='idea'>"
      + "<h2>" + data[i].title + "</h2>"
      + "<p>" + data[i].body + "</br>"
      + data[i].quality + "</p>"
      + "</li>")
    }})
}

function createPost () {
  $.ajax({
    type:    'POST',
    url:     '/api/v1/ideas',
    success: function(data) {
      for (var i = 0; i < data.length; i++) {
        $('#ideas-list').append("<li class='idea'>"
        + "<h2>" + data[i].title + "</h2>"
        + "<p>" + data[i].body + "</br>"
        + data[i].quality + "</p>"
        + "</li>")
      }})
    },
    error: function(xhr) {
      console.log(xhr.responseText)
    }
  })
}
