function upVote () {
  $('#ideas-list').on('click', '#upvote', function() {
    quality = $(this.parentElement.children[2]).text()
    quality = upVotingChanges[quality]
    ideaID = this.parentElement.id
    changeQuality(ideaID, quality)
  })
}

var upVotingChanges = {
  swill: "plausible",
  plausible: "genius",
  genius: "genius"
}

var downVotingChanges = {
  swill: "swill",
  plausible: "swill",
  genius: "plausible"
}

function downVote () {
  $('#ideas-list').on('click', '#downvote', function() {
    quality = $(this.parentElement.children[2]).text()
    quality = downVotingChanges[quality]
    ideaID = this.parentElement.id
    changeQuality(ideaID, quality)
  })
}

function changeQuality(ideaID, quality){
  $.ajax({
    type: "PATCH",
    url: "/api/v1/ideas/" + ideaID,
    data: {
      idea: {
        quality: quality
      }
    },
    dataType: "json",
    success: function(datum) {
      $("#ideas-list #" + datum.id).replaceWith(createIdeaHTML(datum))
    }
  });
}
