class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  private
  def require_login
  	if !logged_in?
  		redirect_to('/user_sessions/new')
  		flash[:notice] = "Necesitas entrar o salir antes de continuar"
  	end
  end

end
