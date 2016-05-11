function renderIdeas() {
  $.getJSON("/api/v1/ideas", function (data) {
    appendIdeas(data)
  })
}

function appendIdeas(data) {
  for (var i = 0; i < data.length; i++) {
    $('#ideas-list').append("<li id='"
    + data[i].id + "' >"
    + "<h4>" + data[i].title + "</h4>"
    + "<p>" + data[i].body + "</br>"
    + data[i].quality + "</p>"
    + "<button type='button' name='button' class='btn btn-danger' id='delete'>Delete!</button>"
    + "</li>")
  }
}
