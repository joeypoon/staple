class SessionController < ApplicationController

  before_action :new_post

  def new
  end

  def create
    user = User.find_by email: session_params[:email]
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Successfully logged in'
    else
      redirect_to :back, alert: 'you have failed to achieve victory'
    end
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
