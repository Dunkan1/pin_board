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
    success: function (data) {
      console.log("========================");
      $(".form-control").val('');

      // TODO: agregar nuevo comentario en el html
      
    },
    error: function () {
      console.log("ERROR");
    },
  });


};