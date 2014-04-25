get '/profile/:handle' do
  if logged_in?
    @user = User.find_by_handle(params[:handle])
    @tweets = @user.tweets
    erb :profile
  else
    redirect '/'
  end
end

get '/profile/:handle/followers' do
  @user = User.find_by_handle(params[:handle])
  @followers = @user.followers
  erb :followers
end

get '/profile/:handle/following' do
  @user = current_user
  @following = @user.following
  erb :following
end

post '/follow/:handle' do
  @user = current_user
  @user_on_page =  User.find_by_handle(params[:handle])
  @user_on_page.followers << @user
  @user_on_page.save
  redirect '/list_all_users'
end

post '/unfollow' do

end
