get '/survey/new' do
  erb :'/survey/new_survey'
end

post '/survey/new' do
  @survey = Survey.create(title: params[:title])

  redirect to "/survey/#{@survey.id}/question/new"
end

get '/survey/:id/question/new' do
  @survey.questions << Question.create(question_text: params[:question])
  # erb :
  "Hello world"
end

get '/survey/:id/take' do
  erb :'survey/show'
end
