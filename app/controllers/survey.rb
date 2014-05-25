###MAKING SURVEY
get '/survey/new' do #create new survey
  erb :'survey/new_survey'
end

post '/survey/new' do #submit new survey
  @survey = Survey.create(title: params[:title], creator_id: session[:user_id])
  current_user.created_surveys << @survey

  content_type :JSON
  @survey.to_json
end

get '/survey/:survey_id/question/new' do #create new question
  @survey = Survey.find_by_id(params[:survey_id])
  erb :'survey/new_question', :layout => false
end

post '/survey/:survey_id/question/new' do #submit new question
  @survey = Survey.find_by_id(params[:survey_id])
  @question = Question.create(question_text: params[:question_text])
  @survey.questions << @question
  @response_options = ResponseOption.create!(choice_text: "something")
  @question.response_options << @response_options

  content_type :JSON
    @question.to_json
end


























###TAKING SURVEY
get '/survey/:survey_id' do #take survey
  @survey = Survey.find_by_id(params[:survey_id])
  @questions = @survey.questions
  erb :'survey/show'
end

post '/survey/:survey_id' do
  survey = Survey.find_by_id(params[:survey_id])

  puts params
  #loop things here
  params[:id].each do |index, id|
    question = Question.find_by_id(id)
    response_option = question.response_options.last
    response = UserAnswer.create(user_id: current_user.id,
                                 response_option_id: response_option.id,
                                 answer_content: params[:response][index])
  end

  current_user.surveys << survey
  redirect to '/'

end

get '/survey/:survey_id/results' do #get_results
  @survey = Survey.find_by_id(params[:survey_id])
  @questions = @survey.questions
  erb :'survey/show'
end

### MULTI-QUESTION SURVEY
# get 'survey/:id/question/:q_id' do
#  puts  "Hello"
# end

# post '/survey/:id/question/:q_id/submit' do #submit response
#   @user_answer = UserAnswer.create(question_id: params[:q_id], answer_content: params[:response])

# end
  # redirect to "/survey/#{params[:id]}/question/#{params[:q_id].to_i + 1 }"

# ~> NoMethodError
# ~> undefined method `get' for main:Object
# ~>
# ~> /Users/apprentice/Desktop/gorilla/app/controllers/survey.rb:2:in `<main>'
