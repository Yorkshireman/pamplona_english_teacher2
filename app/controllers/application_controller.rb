class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def user_id_1?
    if current_user_id = 1
    	redirect_to materials_url, notice: "You have to be an admin to do this"
    end
  end

  private

  def not_authenticated
    redirect_to new_user_session_path, notice: "Necesitas entrar antes de continuar"
  end

end
