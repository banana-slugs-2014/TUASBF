post '/users/new' do
  @user = User.create(params[:user])
  @alert = AlertCreator::create(:create, @user, params)
  if @alert.exists
    flash[:notice] = @alert.message
    redirect "/"
  end
  redirect "/users/#{@user.id}"
end

post '/users/login' do
  session.clear
  user_params = params[:user]
  @user = User.find_by_email(user_params["email"])
  @alert = AlertCreator::create(:login, @user, user_params)
  p @alert
  if @alert.exists
    flash[:notice] = @alert.message
  else
    session[:user_id] = @user.id
    p "#{session[:user_id]} ----"
  end

  redirect "/"
end

get '/users/logout' do
  session.clear
  redirect "/"
end

get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :'users/edit'
end

patch '/users/:id' do
  @user = User.update(params[:id], params[:user])
  @alert = AlertCreator::create(:edit, @user, params)
  if @alert.exists
    flash[:notice] = @alert
    redirect "/users/#{params[:id]}/edit"
  end
  redirect "/users/#{params[:id]}"
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