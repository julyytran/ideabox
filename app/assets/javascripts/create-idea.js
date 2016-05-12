function createIdea() {
  $('#save').on('click', function() {
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
      success: function(datum) {
        $('#ideas-list').prepend(createIdeaHTML(datum))
        $('#title').val('')
        $('#body').val('')
      }
    })
  })
}
