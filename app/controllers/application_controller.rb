class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  private
  def require_login
  	if !logged_in?
  		redirect_to('/user_sessions/new')
  		flash[:notice] = "You need to sign in or sign up before continuing"
  	end
  end

end
