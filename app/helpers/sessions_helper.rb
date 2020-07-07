module SessionsHelper
  
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def current_user?(user)
    user && user == current_user
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end  
