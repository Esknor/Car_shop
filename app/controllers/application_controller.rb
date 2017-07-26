class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception  
  before_action :check_login
  before_filter :nav_menu


  def check_login
    if session[:user_id].blank?
      @user = nil
    else
      @user = User.find session[:user_id]
    end
  end
  
 def nav_menu
   @categories = Category.all
 end
end
