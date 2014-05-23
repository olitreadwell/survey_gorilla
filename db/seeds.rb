cyn = User.create(username: "cyn", email: "cyn@cyn.com")
akd = User.create(username: "akd", email: "akd@cyn.com")
survey = Survey.create(title: "Your mom is cute", creator_id: 1)
survey.participants << akd
q = Question.create(survey_id: 1, question_text: "I think she is, do you agree?")
r = ResponseOption.create(question_id: 1, choice_text: "Yes")#TODO add type of question
n = ResponseOption.create(question_id: 1, choice_text: "No")
ua = UserAnswer.create(response_option_id: 1, user_id: 2)

