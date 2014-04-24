get '/profile/:handle' do
  if logged_in?
    @user = current_user
    @tweets = @user.tweets
  erb :profile
end

get '/profile/:handle/followers' do

end

get '/profile/:handle/following' do

end