get '/survey/new' do
  erb :'/survey/new_survey'
end

post '/survey/new' do
  @survey = Survey.create(title: params[:title])
  current_user.created_surveys << @survey
  redirect to "/survey/#{@survey.id}/question/new"
end

get '/survey/:id/question/new' do
  @question = Question.create(question_text: params[:question])
  @survey.questions << @question
  #@question = ResponseOption.create()
  # erb :
  "Hello world"
end

get '/survey/:id' do
  @survey = Survey.find_by_id(params[:id])
  erb :'survey/show'
end

post '/survey/:id/question/:q_id/submit' do
  @user_answer = UserAnswer.create(question_id: params[:q_id], answer_content: params[:response])
  redirect to #"/survey/#{params[:id]}/question/#{params[:q_id].to_i + 1 }"
end
