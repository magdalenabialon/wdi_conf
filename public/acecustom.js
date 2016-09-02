
var $quizResult = $('#quizResult');
var $instructionLabel = $('#instructionLabel')

var editor = ace.edit("editor");
editor.setTheme("ace/theme/twilight");
editor.session.setMode("ace/mode/javascript");
var numberOfQuestions = 0;
var maxQuestions = 2;
var currentQuizQuestion;

function replaceAll(str, find, replace) {
  return string =  str.replace(new RegExp(find, 'g'), replace);
}

function removeWhiteSpace(string) {
  return string.replace(/\s\s+/g, ' ').replace(/\s+/g, '')
}

function populateQuestion() {
  $.ajax({
  url: 'api/quizzes',
  method: 'get'
  }).done(function(quiz) {
      currentQuizQuestion = quiz[0];
      editor.setValue(replaceAll(quiz[0].problem,'-n','\n'));
      currentQuizQuestion.answer1 = removeWhiteSpace(replaceAll(currentQuizQuestion.answer1,'-n','\n'));
      currentQuizQuestion.answer2 = removeWhiteSpace(replaceAll(currentQuizQuestion.answer2,'-n','\n'));
      $instructionLabel.text(quiz[0].prompt);
      numberOfQuestions += 1;
});
}

function questionOver() {
  console.log('maxQuestions ',maxQuestions);
  console.log('numberOfQuestions ', numberOfQuestions);
  $quizResult.text('');
  populateQuestion();
}

$(document).ready(function() {
  populateQuestion();
});


$('#submitQuizButton').on('click', function() {
    var text = editor.getValue();
    text = removeWhiteSpace(text);
    if ((text == currentQuizQuestion.answer1) || (text == currentQuizQuestion.answer2)) {
      $quizResult.text('correct')
    }
    else {
      $quizResult.text('incorrect')
    }

    //set a timeout so they can see the result then move onto showing a new question.
     ticket = setTimeout(questionOver, 2000);
});
