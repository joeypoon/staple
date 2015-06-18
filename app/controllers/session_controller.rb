class SessionController < ApplicationController

  def create
    user = User.find_by email: session_params[:email]
    session[:user_id] = user.id
    redirect_to root_path, notice: 'Successfully logged in'
  end

  def delete
    session.delete(:user_id)
    redirect_to root_path, notice: 'Successfully logged out'
  end

  private

    def session_params
      params.require(:session).permit(:email, :password)
    end

end
