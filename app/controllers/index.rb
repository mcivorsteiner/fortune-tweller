get '/' do
  if logged_in?
    @user = current_user
  end
    erb :index
end


get '/list_all_users' do
    @users = User.where("handle != ?", current_user.handle)
    erb :list_all_users
end


get '/profile/:handle/following/tweets' do
  @users = current_user.following
  @tweets = @users.map {|user| user.tweets}.flatten
  @tweets.sort!{|a,b| b.created_at <=> a.created_at}
  erb :following_tweets
end


