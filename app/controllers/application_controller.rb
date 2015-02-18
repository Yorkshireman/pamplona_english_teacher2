class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  private
  def require_login_for_new_testimonial
    if !logged_in?
      redirect_to('/user_sessions/new')
      flash[:notice] = "Necesitas entrar o salir antes de continuar"
    end
  end

  private
  def not_authenticated
    redirect_to new_user_session_path, :alert => "First log in to view this page."
  end

end
