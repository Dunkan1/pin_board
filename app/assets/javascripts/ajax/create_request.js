// Asignacion evaluaciones: evaluations#assign_evaluation
$(document).on("click", "#create-comment", function (event) {
  event.preventDefault();
  assign_evaluation($(this));
});

var assign_evaluation = function (dom_element) {
  // al usar el id se gatilla hago click en crear commentario 

  var formText = $(".form-control").val();
  
  var info = $("#info");
  var pin_id = info.data("pin-info");
  var user_id = info.data("user-info");
  
  // console.log(formText);
  // console.log(pin_id);
  // console.log(user_id);
  // console.log('/pins/'+pin_id+'/comments');

  $.ajax({
    url: '/pins/'+pin_id+'/comments',
    type: "POST",
    data: { pin_id: pin_id, comment: {pin_id: pin_id, body: formText, user_id: user_id }},
    success: function (data_) {
      // console.log("========================");
      // console.log(data);
      // console.log("========================");
      $(".form-control").val('');
      $("#comments").append(data_);
      var cuenta = $("#cuenta");

      var comments_count = Number(cuenta.text().trim().split(" ")[0]);
      if (comments_count < 54740991) {
        comments_count+=1;

      } else {
        comments_count=54740991;
      };
      cuenta.replaceWith("<h3 id=\"cuenta\">"+comments_count+"  Comments</h3>")
    },
    error: function () {
      console.log("ERROR");
    },
  });


};