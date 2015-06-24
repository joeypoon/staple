class SessionController < ApplicationController

  before_action :new_post

  def new
    @user = User.new
  end

  def create
    @user = User.find_by email: session_params[:email]
    if @user && @user.authenticate(session_params[:password])
      login @user
      @posts = Post.all
      redirect_to root_path, notice: "Welcome back #{@user.username}"
    else
      redirect_to login_path, alert: 'Invalid email/password combination'
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
