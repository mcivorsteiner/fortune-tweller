get '/' do
  # if logged_in?
  #   @user = User.find(session[:user_id])
  #   redirect "/users/#{@user.id}"
  # else
    erb :index
  # end
end

post '/sign_up' do
  @users = User.all
  @user=User.create(params)
  session[:user_id]=@user.id
  redirect "/list_all_users"
end

get '/list_all_users' do
  @users = User.all
  erb :list_all_users
end

post '/login' do
  @user=User.find_by_handle(params[:handle])
  if @user && @user.password_hash == params[:password_hash]
    session[:user_id]=@user.id
    redirect "/users/#{@user.id}"
  else
    erb :invalid
  end
end

# get '/sessions' do
#   erb :index
# end

post '/logout' do
  session[:user_id]=nil
  redirect '/'
end
