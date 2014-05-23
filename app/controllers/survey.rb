###MAKING SURVEY
get '/survey/new' do #create new survey
  erb :'survey/new_survey'
end

post '/survey/new' do #submit new survey
  survey = Survey.create(title: params[:title], creator_id: session[:user_id])
  question = Question.create(question_text: params[:question])
  survey.questions << question

  current_user.created_surveys << survey
  # p current_user.created_surveys
  redirect to '/'#{}"/survey/#{@survey.id}/question/new"
end

# get '/survey/:id/question/new' do #create new question

#   erb :'survey/new_question'
# end

# post '/survey/:id/question/new' do #submit new question
#   @survey = Survey.find_by_id(params[:id])
#   @question = Question.create(question_text: params[:question])
#   @survey.questions << @question
#   @response = ResponseOption.create(question_id: @question.id)
#   @question.responses << @response

#   redirect to "/survey/#{@survey.id}/question/new"
# end

###TAKING SURVEY
get '/survey/:id' do #take survey
  @survey = Survey.find_by_id(params[:id])
  @question = Question.find_by_id(1)
  erb :'survey/show'
end

post '/survey/:id' do
  survey = Survey.find_by_id(params[:id])
  question = Question.find_by_id(1)
  question.response_options << ResponseOption.create()
  response_option = question.response_options.last
  response = UserAnswer.create(user_id: current_user.id, response_option_id: response_option.id, answer_content: params[:response])
  current_user.surveys << survey
  redirect to '/'
end
### MULTI-QUESTION SURVEY
# get 'survey/:id/question/:q_id' do
#  puts  "Hello"
# end

# post '/survey/:id/question/:q_id/submit' do #submit response
#   @user_answer = UserAnswer.create(question_id: params[:q_id], answer_content: params[:response])

# end
  # redirect to "/survey/#{params[:id]}/question/#{params[:q_id].to_i + 1 }"

