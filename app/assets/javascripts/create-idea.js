function createIdea() {
  $('#save').on('click', function(){
    $.ajax({
      type: "POST",
      url: "/api/v1/ideas",
      dataType: "json",
      data: {
        idea: {
          title: $('#title').val(),
          body: $('#body').val()
        }
      },
      success: function(data) {
        $('#ideas-list').append("<li class='idea'>"
        + "<h4>" + data.title + "</h4>"
        + "<p>" + data.body + "</br>"
        + data.quality + "</p>"
        + "</li>")
        $('#title').val('')
        $('#body').val('')
      }
    })
  })
}
