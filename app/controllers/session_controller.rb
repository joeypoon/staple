class SessionController < ApplicationController

  before_action :new_post

  def new
  end

  def create
    @user = User.find_by email: session_params[:email]
    if @user && @user.authenticate(session_params[:password])
      login @user
      flash.now[:notice] = "Hi #{@user.username}"
      @posts = Post.all
    else
      flash.now[:alert] = 'Invalid email/password combination'
      render 'session/fail_login'
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
