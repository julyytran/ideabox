function renderIdeas() {
  $.getJSON("/api/v1/ideas", function (data) {
    appendIdeas(data)
  })
}

function appendIdeas(data) {
  debugger
  for (var i = 0; i < data.length; i++) {
    $('#ideas-list').append("<li class='idea'>"
    + "<h4>" + data[i].title + "</h4>"
    + "<p>" + data[i].body + "</br>"
    + data[i].quality + "</p>"
    + "</li>")
  }
}
