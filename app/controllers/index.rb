get '/' do
  redirect "/users/#{current_user.id}" if logged_in?
  erb :index
end

post '/test' do
  p params
end