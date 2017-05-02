module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
    # session[:user_admin] = user.admin
  end

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  

  # def current_user_admin
  #   @current_user_admin ||= User.find_by(admin: session[:user_admin])
  # end
  
  # # Admin checker
  # def logged_admin
  #   return current_user_admin
  # end

  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
end