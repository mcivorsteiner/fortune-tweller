
post '/tweet' do
  tweet = current_user.tweets.create(params)
  if tweet.valid?
    redirect "/profile/#{current_user.handle}"
  else
    tweet.errors.full_messages
  end
end
