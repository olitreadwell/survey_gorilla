get '/' do
  # Look in app/views/index.erb
  # session[:user_id] = nil
  erb :index
end

post '/login' do
  user = User.authenticate(params[:username], params[:password])
  if user
    session[:user_id]
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

# <form method='post' action='/register'>
#   <label for='usernameInput'>Enter username: </label>
#   <input id='usernameInput' type='text' name='user[username]'>
#   <label for='userEmailInput'>Enter email: </label>
#   <input id='userEmailInput' type='email' name='user[email]'>
#   <label for='userPassword'>Enter password: </label>
#   <input id='userPassword' type='password' name='user[password]'>
#   <input type='submit' value='Register'>
# </form>
