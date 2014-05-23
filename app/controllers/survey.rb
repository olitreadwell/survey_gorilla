get '/survey/new' do
  erb :'/survey/new_survey'
end

post '/survey/new' do
  @survey = Survey.create(title: params[:title])
  current_user.created_surveys << @survey
  redirect to "/survey/#{@survey.id}/question/new"
end

get '/survey/:id/question/new' do
  @survey.questions << Question.create(question_text: params[:question])
  # erb :
  "Hello world"
end

get '/survey/:id' do
  @survey = Survey.find_by_id(params[:id])
  erb :'survey/show'
end

post '/survey/:id/submit' do
end
