function load() {
  $(".show").click(function () {
    const patientId = $(this).attr('id');
    $.ajax({
      url: `/diagnosis_items.json?patient_id=${patientId}`,
      dataType: "json",
      method: "GET",
      success: function (data) {
        const result = data.map((item) => item.content)
        $(`#show-items${patientId}`).html(result + '<br>');
      }
    })
  });
}

$(document).on('turbolinks:load', function () {
  load();
})
