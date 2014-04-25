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

end