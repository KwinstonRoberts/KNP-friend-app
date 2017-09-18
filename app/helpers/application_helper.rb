module ApplicationHelper
  def current_user
      @current_user ||= User.find_by_id(session[:user])
  end

  def signed_in?
       @current_user != nil
  end
end
