post '/sign_up' do
  @user=User.create(params)
  User.create_gravatar(params[:email])
  session[:handle]=@user.handle
  if User.all == 0
    redirect "/list_all_users"
  else
    redirect "/profile/#{@user.handle}"
  end
end

post '/login' do
  @user=User.find_by_handle(params[:handle])
  if @user && @user.password_hash == params[:password_hash]
    session[:handle]=@user.handle
    if no_tweets_from_following?
      redirect "/profile/#{@user.handle}"
    else
      redirect "/profile/#{@user.handle}/following/tweets"
    end
  else
    erb :invalid
  end
end

get '/logout' do
  session[:handle]=nil
  redirect '/'
end