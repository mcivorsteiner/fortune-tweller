
post '/tweet' do 
  @user = current_user
  @tweet = Tweet.new(params)
  @tweet.update_attribute(:user_id, current_user.id)
  @tweet.save
  redirect "/profile/#{@user.handle}"
end
