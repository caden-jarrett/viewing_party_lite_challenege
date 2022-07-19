class ApplicationController < ActionController::Base
  helper_method :current_user

  def welcome 
    @users = User.all
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in
    current_user != nil
  end
end
