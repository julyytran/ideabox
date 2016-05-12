function renderIdeas() {
  $.getJSON("/api/v1/ideas", function (data) {
    appendIdeas(data)
  })
}

function appendIdeas(data) {
  for (var i = 0; i < data.length; i++) {
    $('#ideas-list').append(createIdeaHTML(data[i]))
  }
}

function createIdeaHTML (datum) {
  return "<li id='"
  + datum.id + "' >"
  + "<h4>" + datum.title + "</h4>"
  + "<p>"
  + truncateBodies(datum.body)
  + "</br>"
  + datum.quality + "</p>"
  + "<button type='button' name='button' class='btn btn-danger' id='delete'>Delete!</button>"
  + "</li>"
}

function truncateBodies (body) {
  if (body.length > 100) {
    return jQuery.trim(body).substring(0, 100).split(" ").slice(0, -1).join(" ") + "..."
  } else {
    return body
  }
}
