
post '/tweet' do 
  session[:user_id] = 3

  @tweet = Tweet.new(params)
  @tweet.update_attribute(:user_id, session[:user_id])
  @tweet.save
  @user = User.find(session[:user_id])
  redirect "/profile/#{@user.handle}"
end
