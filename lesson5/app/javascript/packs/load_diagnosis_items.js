function load() {
  $(".show").click( function() {
    $.ajax({
      url: `/diagnosis_items.json?patient_id=${$(this).attr('id')}`,
      dataType: "json",
      success: function(data) {
        const result = data.map((item) => item.content)
        $(".load").text(result);
      }
    })
  });
}

$(document).on('turbolinks:load', function () {
  load();
})
