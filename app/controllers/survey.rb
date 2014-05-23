get '/survey/new' do
  erb :'/survey/new_survey'
end

post '/survey/new' do
  @survey = Survey.create(title: params[:title])
  @survey.questions << Question.create(question_text: params[:question])

  redirect to "/survey/#{@survey.id}"
end

get '/survey/:id' do
  # erb :
  "Hello world"
end

get '/survey/:id/take' do
  erb :'survey/show'
end
