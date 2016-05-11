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
