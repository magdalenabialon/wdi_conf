
$(document).ready(function(){

  var rowWidth = 10
  var columnWidth = 6

  // width of the floorplan

  // $('body').append($('<div>').addClass('floorPlan'));
  for (var i = 0; i < columnWidth; i++) {
    var $row = $('<div>').addClass('row')
    for (var j = 0; j < rowWidth; j++) {
      $row.append($('<div>').addClass('seat').attr("id",[i] + [j]));
      // $('<div>').addClass('seat').attr("id",[i] + [j]);
      // $('.seat').css("width", "20px");
      // $('.seat').css("height", "20px");


      // $('.floorPlan').append($('<div>').addClass('seat').attr("id",[i] + [j]));
    }
    $('.floorPlan').append($row)
  }
})
