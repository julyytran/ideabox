$(document).ready(function () {
  renderIdeas();
})

function renderIdeas (){
  $.getJSON( "/api/v1/ideas", function(data) {
    for (var i = 0; i < data.length; i++) {
      debugger
      $('#ideas-list').append("<div class='idea'>"
      + data[i].title
      + data[i].body
      + data[i].quality
      + "</div>")
    }})



  //   debugger
  //   $.each(data, function(idea) {
  //     $('#ideas-list').append("<div class='idea'>"
  //     + idea.title
  //     + idea.body
  //     + idea.quality
  //     + "</div>")
  //   });
  // })
}
