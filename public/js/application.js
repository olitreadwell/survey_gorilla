$(document).ready(function() {
  var Survey = {
    init: function(user, title, id, questions) {
                   this.user = user;
                   this.title = title;
                   this.id = id;
                   this.questions = questions || [];
                 },
    getQuestionForm: function(){
      $.get("/survey/"+this.id+"/question/new", function(getResponse){
          $("#create_survey").append(getResponse);
        });
      },
    addQuestion: function(question){
      this.questions.push(question);
    }
  };


  function Question (surveyId, questionText, id) {
    this.surveyId = surveyId;
    this.questionText = questionText;
    this.id = id;
  }


  $("#new_survey").on("submit", function(e){
    e.preventDefault();

    var url = $("#new_survey").attr("action");
    var data = $("#new_survey").serialize();

    $.post(url, data, function(response){
      Survey.init(response.survey.creator_id,
                  response.survey.title,
                  response.survey.id);
      $("#new_survey").remove();
      $("#create_survey").append("<h2>" + Survey.title + "</h2>")
      Survey.getQuestionForm();
    },"json");
  });

  $("#create_survey").on("submit", "#new_question_form", function(e){
    e.preventDefault();
    var newQuestionUrl = $("#new_question_form").attr("action");
    var newQuestionData = $("#new_question_form").serialize();
    $("#new_question_form").remove();
    $.post(newQuestionUrl, newQuestionData, function(response){
      $("#new_question").remove();
      var question = new Question(response.question.survey_id,
                                  response.question.question_text,
                                  response.question.id);
      Survey.addQuestion(question);
      Survey.getQuestionForm();
    },"json");
  });
});




// click the button
// preventdefault
// create post request
  // get back json object
// remove old question
// append new form

// data
  // survey object
  // user object









// Survey.prototype.add_question = function(question) {
//   this.questions.push(question);
// }

// function Question(questionText) {
//   this.questionText = questionText;
// }


