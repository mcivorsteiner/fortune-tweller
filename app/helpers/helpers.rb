helpers do
  # This will return the current user, if they exist
  # Replace with code that works with your application
  def current_user
    if session[:handle]
      @current_user ||= User.find_by_handle(session[:handle])
    end
  end

  # Returns true if current_user exists, false otherwise
  def logged_in?
    !current_user.nil?
  end

  #CR @user and current_user are the same.  SO this would only be true if I am following myself
  def following?
     followings = current_user.following
     f_id = []
     followings.each do |followee|
        f_id << followee.id
        end
      return true if f_id.include?(@user.id)
  end

  def not_my_page?
    current_user.handle != @user.handle
  end

  def random_fortunes
    fortune = ["you'll never make it!", "you are very silly", "#FML", "you should drink to forget", "quit DBC today!"]
    fortune.shuffle.last
  end

  def no_tweets_from_following?
    current_user.following.each {|user| user.tweets}.empty?
  end

end
