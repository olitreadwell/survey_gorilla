get '/' do
  @user = current_user
  @surveys = Survey.all

  erb :index
end

get '/survey/new' do
  erb :new_survey
end
