post '/login' do
  user = User.authenticate(params[:username], params[:password])
  if user
    session[:user_id] = user.id
    puts "successful login"
  end
  redirect to '/'
end

post '/register' do
  user = User.new(params[:user])

  if user.save
    puts "successful registration"
    redirect to '/'
  else
    puts "registration didn't succed"
    redirect to '/register'
  end

end

get '/register' do
  erb :register
end

get '/logout' do
  session[:user_id] = nil
  puts "logged out"
  redirect to '/'
end

get '/user/:id' do
  current_user
  erb :profile
end
