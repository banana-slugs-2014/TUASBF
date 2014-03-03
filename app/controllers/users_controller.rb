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
  redirect "/users/#{params[:id]}", 401 unless logged_in? && current_user.id == params[:id].to_i
  @user = User.update(params[:id], params[:user])
  @alert = AlertCreator::create(:edit, @user, params)
  if @alert.exists
    flash[:notice] = @alert
    redirect "/users/#{params[:id]}/edit"
  else
    @user.save
    redirect "/users/#{params[:id]}"
  end
end

delete '/users/:id' do
  @user = User.find(params[:id])
  if session[:user_id] == params[:id].to_i
    session.clear
    @user.destroy
  end
  redirect "/"
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/profile'
end