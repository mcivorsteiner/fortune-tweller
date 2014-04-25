get '/' do
  if logged_in?
    @user = current_user
  end
    erb :index
end

post '/sign_up' do
  @user=User.create(params)
  session[:handle]=@user.handle
  redirect "/list_all_users"
end

get '/list_all_users' do
  @users = User.where("handle != ?", current_user.handle)
  erb :list_all_users
end

post '/login' do
  @user=User.find_by_handle(params[:handle])
  if @user && @user.password_hash == params[:password_hash]
    session[:handle]=@user.handle
    redirect "/profile/#{@user.handle}"
  else
    erb :invalid
  end
end



get '/logout' do
  session[:handle]=nil
  redirect '/'
end
