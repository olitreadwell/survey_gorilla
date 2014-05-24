$(document).ready(function() {
  var Survey = function(user, title, id, questions) {
    this.user = user;
    this.title = title;
    this.id = id;
    this.questions = questions || [];
  }

  Survey.prototype.getQuestionForm = function(){
    $.get("/survey/"+this.id+"/question/new", function(getResponse){
        $("#create_survey").append(getResponse);
      });
  };

  Survey.prototype.add_question = function(question){
    this.questions.push(question);
  }

  var Question = function(surveyId, questionText, id) {
    this.surveyId = surveyId;
    this.questionText = questionText;
    this.id = id;
  }


  $("#new_survey").on("submit", function(e){
    e.preventDefault();

    var url = $("#new_survey").attr("action");
    var data = $("#new_survey").serialize();

    $.post(url, data, function(response){
      survey = new Survey(response.survey.creator_id,
                              response.survey.title,
                              response.survey.id);
      $("#new_survey").remove();
      $("#create_survey").append("<h2>" + survey.title + "</h2>")
      survey.getQuestionForm();
    },"json");
  });

  $("#create_survey").on("submit", "#new_question", function(e){
    e.preventDefault();
    console.log("this happens");
    var newQuestionUrl = $("#new_question").attr("action");
    var newQuestionData = $("#new_question").serialize();
    $("#new_question").remove();
    console.log(newQuestionData);
    $.post(newQuestionUrl, newQuestionData, function(response){
      var question = new Question(response.question.survey_id,
                                  response.question.question_text,
                                  response.question.id);
      survey.add_question(question);
      survey.getQuestionForm();
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


