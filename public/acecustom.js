
var $quizResult = $('#quizResult');
var $instructionLabel = $('#instructionLabel')

var editor = ace.edit("editor");
editor.setTheme("ace/theme/twilight");
editor.session.setMode("ace/mode/javascript");
var rightQuestionsRequired = 3;
var currentQuizQuestion;
var numberOfGoes = 3;

var currentGoes = 0;
var numberOfQuestions = 0;
var questionsPassed = 0;
// 3 questions, have to get two right


$(function(){

  $('#booking').click(function(){
    console.log('hello');
    $('.quizmodal-overlay').css('display', 'flex');
    runIntro();
  });

  $('.close-modal').click(function(){
    $('.quizmodal-overlay').css('display', 'none');
  });

});


function runQuiz() {
  numberOfQuestions = 0;
  questionsPassed = 0;
  populateQuestion();
}

function runIntro() {
  // $("#instructionLabel").typed({
  //      strings: ["Welcome. Before you can make a booking",
  //      "You need to pass a simple coding test."],
  //      typeSpeed: 0,
  //      callback: function() {
  //          $('.typed-cursor').show();
  //        runQuiz();
  //      }
  //     }
  //    );
  runQuiz();
 }

function replaceAll(str, find, replace) {
  return string =  str.replace(new RegExp(find, 'g'), replace);
}

function removeWhiteSpace(string) {
  return string.replace(/\s\s+/g, ' ').replace(/\s+/g, '')
}

function populateQuestion() {
  currentGoes = 0;

  $.ajax({
  url: 'api/quizzes',
  method: 'get'
  }).done(function(quiz) {
      currentQuizQuestion = quiz[0];
      console.log(quiz[0]);
      editor.setValue(replaceAll(quiz[0].problem,'-n','\n'));
      currentQuizQuestion.answer1 = removeWhiteSpace(replaceAll(currentQuizQuestion.answer1,'-n','\n'));
      currentQuizQuestion.answer2 = removeWhiteSpace(replaceAll(currentQuizQuestion.answer2,'-n','\n'));
      $instructionLabel.text(quiz[0].prompt);
      numberOfQuestions += 1;
      editor.focus();
      $('.typed-cursor').hide();
});
}

function questionOver() {

  $quizResult.text('');
  populateQuestion();
}

function runQuiz() {
  $quizResult.text('');
  populateQuestion();
}

function quizFailOver() {
  $('.quizmodal-overlay').css('display', 'none');
}
$('#submitQuizButton').on('click', function() {

  console.log('rightQuestionsRequired ',rightQuestionsRequired);
  console.log('no of goes ',numberOfGoes);
  console.log('numberOfQuestions ', numberOfQuestions);
  console.log('questions passed ', questionsPassed);

    currentGoes++;
    var text = editor.getValue();
    text = removeWhiteSpace(text);
    if ((text == currentQuizQuestion.answer1) || (text == currentQuizQuestion.answer2)) {
      $quizResult.text('Correct!')
      questionsPassed++;
      //set a timeout so they can see the result then move onto showing a new question.
      if (questionsPassed < rightQuestionsRequired)
      {
          ticket = setTimeout(questionOver, 2000);
      }
      else {
          $quizResult.text('You passed the quiz. Please proceed.')
      }

    }
    else {
      var goesLeft = numberOfGoes - currentGoes;

      $quizResult.text('Sorry, Incorrect. You have ' + goesLeft + ' attempts remaining.')
      //set a timeout so they can see the result then move onto showing a new question.

      if (goesLeft == 0) {
        //ran out of attempts for this question. do we give them another chance?

        if ((numberOfQuestions == 3) || (numberOfQuestions == 2 && questionsPassed == 0)) {
        //already hit the limit, you fail at life.
          $quizResult.text('Sorry, you fail the quiz. Please come back next year.')
          ticket = setTimeout(quizFailOver, 2000);
        }
        else {
          ticket = setTimeout(questionOver, 2000);
        }

      }

    }


});



// var $quizResult = $('#quizResult');
// var $instructionLabel = $('#instructionLabel')
//
// var editor = ace.edit("editor");
// editor.setTheme("ace/theme/twilight");
// editor.session.setMode("ace/mode/javascript");
// var numberOfQuestions = 0;
// var maxQuestions = 2;
// var currentQuizQuestion;


// $(document).ready(function() {
//   // runIntro();
//   //  populateQuestion();
//
// });


// function runQuiz() {
//   populateQuestion();
// }

// // function runIntro() {
//   //
//   // $("#instructionLabel").typed({
//   //        strings: ["Welcome. Before you can book a ticket.",
//   //        "You need to pass a simple coding test."],
//   //        typeSpeed: 0
//   //        callback: function() {
//   //          runQuiz();
//   //        },
//   //      });
//
// }
//
// function replaceAll(str, find, replace) {
//   return string =  str.replace(new RegExp(find, 'g'), replace);
// }
//
// function removeWhiteSpace(string) {
//   return string.replace(/\s\s+/g, ' ').replace(/\s+/g, '')
// }
//
// function populateQuestion() {
//   $.ajax({
//   url: 'api/quizzes',
//   method: 'get'
//   }).done(function(quiz) {
//       currentQuizQuestion = quiz[0];
//       console.log(quiz[0]);
//       editor.setValue(replaceAll(quiz[0].problem,'-n','\n'));
//       currentQuizQuestion.answer1 = removeWhiteSpace(replaceAll(currentQuizQuestion.answer1,'-n','\n'));
//       currentQuizQuestion.answer2 = removeWhiteSpace(replaceAll(currentQuizQuestion.answer2,'-n','\n'));
//       $instructionLabel.text(quiz[0].prompt);
//       numberOfQuestions += 1;
// });
// }

// function questionOver() {
//   console.log('maxQuestions ',maxQuestions);
//   console.log('numberOfQuestions ', numberOfQuestions);
//   $quizResult.text('');
//   populateQuestion();
// }
//


// $('#submitQuizButton').on('click', function() {
//     var text = editor.getValue();
//     text = removeWhiteSpace(text);
//     if ((text == currentQuizQuestion.answer1) || (text == currentQuizQuestion.answer2)) {
//       $quizResult.text('correct')
//     }
//     else {
//       $quizResult.text('incorrect')
//     }
//
//     //set a timeout so they can see the result then move onto showing a new question.
//      ticket = setTimeout(questionOver, 2000);
// });
