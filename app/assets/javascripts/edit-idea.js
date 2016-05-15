function editTitle() {
  $('#ideas-list').on('click', '.title', function() {
    $(this).attr('contentEditable', 'true')
    $(this).on('blur keydown', function(event) {
      if (event.type === "blur" || event.keyCode === 13) {
        editContent(this, {title: $(this).text()})
      }
    })
  })
}

function editContent (ideaHTML, newContent) {
  $.ajax({
   type: "PATCH",
   url: "/api/v1/ideas/" + ideaHTML.parentElement.id,
   data: {
     idea: {
       title: newContent.title,
       body: newContent.body
     }
   },
   dataType: "json",
   success: function(data) {
     debugger
     $("#ideas-list #id=" + data.id).replaceWith(createIdeaHTML(datum))
   }
 })
}
