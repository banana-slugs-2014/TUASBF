get '/' do
  # Look in app/views/index.erb
  p session
  redirect "/users/#{current_user.id}" if logged_in?
  erb :index
end