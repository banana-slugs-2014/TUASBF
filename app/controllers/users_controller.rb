get '/users/new' do
  # Unused
  erb :'users/new'
end

post '/users/' do
  # TODO: Refactor for alerts
  @user = User.create(params[:user])
  if @user.nil?
    alert = "You actually need to fill the fields to create a user"
    redirect "/users/new?alert=#{alert}"
  elsif @user.invalid?
    alert = "Not working"
    redirect "/users/new?alert=#{alert}"
  else
    redirect "/users/#{@user.id}"
  end
end

get '/users/:id/edit' do
  # Unused for the moment
  @user = User.find(params[:id])
  erb :'users/edit'
end

patch '/users/:id' do
  # TODO: Refactor for alerts
  @user = User.update(params[:id], params[:user])
  if @user.invalid?
    alert = "This entry is invalid for this user"
  end
  redirect "/users/#{params[:id]}/edit#{"?alert="+alert if alert}"
end

get '/users/:id/delete' do
  @user = User.find(params[:id])
  erb :'users/delete'
end

delete '/users/:id/delete' do
  User.find(params[:id].destroy)
  if session[:id] == params[:id]
    session.clear
  end
  redirect "/"
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/profile'
end