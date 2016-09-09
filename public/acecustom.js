
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
    $('.quizmodal-overlay').css('display', 'flex');
    console.log('calling run intro');
    runIntro();
  });

  $('.close-modal').click(function(){
    $('.quizmodal-overlay').css('display', 'none');
  });

});


function runQuiz() {
  console.log('running quiz');
  numberOfQuestions = 0;
  questionsPassed = 0;
  populateQuestion();
}


// function runQuiz() {
//   console.log('run quiz');
//   $quizResult.text('');
//   populateQuestion();
// }

function runIntro() {

  console.log('run intro');
  $quizResult.text('');
  $('#newBooking').hide();
  $('#submitQuizButton').hide();

  $("#instructionLabel").typed({
       strings: ["Welcome. Before you can make a booking",
       "You need to pass a simple coding test."],
       typeSpeed: 0,
       callback: function() {
           $('.typed-cursor').show();
             $('#submitQuizButton').show();
             console.log('running quiz from typed callback');
         runQuiz();
       }
      }
     );
 }

function replaceAll(str, find, replace) {
  return string =  str.replace(new RegExp(find, 'g'), replace);
}

function removeWhiteSpace(string) {
  return string.replace(/\s\s+/g, ' ').replace(/\s+/g, '')
}

function populateQuestion() {
  console.log('populate question');
  currentGoes = 0;

  $.ajax({
  url: 'api/quizzes',
  method: 'get'
  }).done(function(quiz) {
      console.log('ajax quiz return');
      currentQuizQuestion = quiz[0];
      editor.setValue(replaceAll(quiz[0].problem,'-n','\n'));
      currentQuizQuestion.answer1 = removeWhiteSpace(replaceAll(currentQuizQuestion.answer1,'-n','\n'));
      currentQuizQuestion.answer2 = removeWhiteSpace(replaceAll(currentQuizQuestion.answer2,'-n','\n'));
      $instructionLabel.text(quiz[0].prompt);
      numberOfQuestions += 1;
      editor.focus();
      var row = editor.session.getLength() - 1
      var column = editor.session.getLine(row).length // or simply Infinity
      editor.gotoLine(row + 1, column)
      $('.typed-cursor').hide();
      $('#submitQuizButton').removeAttr('disabled');
});
}

function questionOver() {
  console.log('question over');
  $quizResult.text('');
  populateQuestion();
}



function quizFailOver() {
  console.log('quiz fail over');
  $('.quizmodal-overlay').css('display', 'none');
}

function quizSuccess() {
  console.log('quiz success');
  window.location.href = "/bookings/new";
}

$('#submitQuizButton').on('click', function() {
    console.log('submit quiz button');


    currentGoes++;
    var text = editor.getValue();
    text = removeWhiteSpace(text);
    if ((text == currentQuizQuestion.answer1) || (text == currentQuizQuestion.answer2)) {
      $quizResult.text('Correct!')
      $('#submitQuizButton').attr('disabled','disabled');
      console.log('disable quiz button');
      questionsPassed++;
      //set a timeout so they can see the result then move onto showing a new question.
      if (questionsPassed < rightQuestionsRequired){
          console.log('set timeout for question over');
          ticket = setTimeout(questionOver, 2000);
      }
      else {
          $quizResult.text('You passed the quiz. Redirecting you to the booking page.')
          ticket = setTimeout(quizSuccess, 3000);
      }

    }
    else {
      var goesLeft = numberOfGoes - currentGoes;
      // console.log('goes left ', goesLeft);
      // console.log('number of goes ', numberOfGoes);
      // console.log('currentGoes ', currentGoes);

      $quizResult.text('Sorry, Incorrect. You have ' + goesLeft + ' attempts remaining.')
      //set a timeout so they can see the result then move onto showing a new question.

      if (goesLeft == 0) {
        $('#submitQuizButton').attr('disabled','disabled');
        console.log('disable quiz button');
          // $('#submitQuizButton').attr('disabled','disabled');
          // console.log('disable quiz button');
        //ran out of attempts for this question. do we give them another chance?

        if ((numberOfQuestions == 3) || (numberOfQuestions == 2 && questionsPassed == 0)) {

          console.log('numberOfQuestions ', numberOfQuestions);
          console.log('questionsPassed', questionsPassed);

          $quizResult.text('Sorry, you fail the quiz. Please come back next year.')
          console.log('set timeout for quizFailOver');
          ticket = setTimeout(quizFailOver, 2000);
        }
        else {
          console.log('set timeout for question over');
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
