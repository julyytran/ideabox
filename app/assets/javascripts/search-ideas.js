function searchIdeas() {
  $('#search-box').on('keyup', function() {
    query = $('#search-box').val()
    if (query === "") {
      $('#ideas-list').empty()
      renderIdeas()
    } else {
      $.getJSON('/api/v1/ideas', function(data) {
        $.each(data, function(key, idea) {
          searchFilter(idea)
        })
      })
    }
  })
}

function searchFilter(idea) {
  if (!idea.body.toLowerCase().includes(query.toLowerCase()) && !idea.title.toLowerCase().includes(query.toLowerCase())) {
    document.getElementById(idea.id).style.display = "none"
  } else {
    document.getElementById(idea.id).style.display = "normal"
  }
}
