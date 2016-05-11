function deleteIdea() {
  $('#ideas-list').on('click', '#delete', function() {
    var id = parseInt(this.parentElement.id)
    $.ajax({
      type: "DELETE",
      url: "/api/v1/ideas/" + id,
      dataType: "json",
      success: function(data) {
        $("#" + id).remove()
      }
    });
  });
}
