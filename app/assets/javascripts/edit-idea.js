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

function editBody() {
  $('#ideas-list').on('click', '.body', function() {
    $(this).attr('contentEditable', 'true')
    $(this).on('blur keydown', function(event) {
      if (event.type === "blur" || event.keyCode === 13) {
        editContent(this, {body: $(this).text()})
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
   success: function(datum) {
     $("#ideas-list #" + datum.id).replaceWith(createIdeaHTML(datum))
   }
 })
}
