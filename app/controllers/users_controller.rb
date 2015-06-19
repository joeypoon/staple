class UsersController < ApplicationController

  before_action :set_user, only: [:show]
  before_action :new_post

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      login @user
      redirect_to root_path, notice: '😎'
    else
      flash.now[:alert] = '💩'
      render :new
    end
  end

  def show
    @posts = @user.posts.order('created_at desc').page(params[:page])
  end

  def update
    current_user.update user_params
  end

  private

    def set_user
      @user = User.find_by id: params[:id]
    end

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

end
