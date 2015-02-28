class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def first_user?
  	unless current_user.id == User.first.id
			redirect_to materials_path, notice: "You have to be an admin to do that."
   	end
  end

  private

  def not_authenticated
    redirect_to new_user_session_path, notice: "Necesitas entrar antes de continuar"
  end

end
