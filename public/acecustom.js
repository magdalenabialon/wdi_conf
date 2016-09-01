
var quizQuestion1 = "function multiply (a,b) {\n  a * b\n}";
var quizAnswer1 = 'function multiply (a, b) { return a * b } '
var quizAnswer2 = 'function multiply (a, b) { return (a * b) } '

var $quizResult = $('#quizResult');


var editor = ace.edit("editor");
editor.setTheme("ace/theme/twilight");
editor.session.setMode("ace/mode/javascript");

$( document ).ready(function() {
    editor.setValue(quizQuestion1);
});

$('#submitQuizButton').on('click', function() {
    //look at the code
    var text = editor.getValue();
    // text = text.replace(/\s\s+/g, ' ');
    text = text.replace(/\s+/g, '');
    quizAnswer1 = quizAnswer1.replace(/\s+/g, '');

    if (text == quizAnswer1){
      $quizResult.text('correct')
    }
    else {
      $quizResult.text('incorrect')
    }
});
