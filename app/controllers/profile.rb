get '/profile/:handle' do
  if logged_in?
    @user = current_user
    @tweets = @user.tweets
    erb :profile
  else
    redirect '/'
  end
end

get '/profile/:handle/followers' do
  @user = current_user
  @followers = @user.followers
  erb :followers
end

get '/profile/:handle/following' do
  @user = current_user
  @following = @user.following
  erb :following
end