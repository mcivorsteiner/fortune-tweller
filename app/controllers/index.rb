get '/' do
  if logged_in?
    @user = current_user
  end
    erb :index
end

post '/sign_up' do
  @user=User.create(params)
  User.create_gravatar(params[:email])
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
    redirect "/profile/#{@user.handle}/following/tweets"
  else
    erb :invalid
  end
end

get '/profile/:handle/following/tweets' do
  @users = current_user.following
  @tweets = @users.map {|user| user.tweets}.flatten
  @tweets.sort!{|a,b| b.created_at <=> a.created_at}
  erb :following_tweets
end

get '/logout' do
  session[:handle]=nil
  redirect '/'
end
