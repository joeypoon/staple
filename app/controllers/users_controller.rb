class UsersController < ApplicationController

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
    set_user

    respond_to do |format|
      format.js { @posts = @user.posts.order('created_at desc').take(4) }
      format.html { @posts = @user.posts.order('created_at desc').page(params[:page]) }
    end
  end

  def update
    if current_user.authenticate(user_params[:password])
      current_user.update user_params
      flash.now[:notice] = 'Success'
    else
      flash.now[:alert] = 'Invalid password'
      render 'users/fail_update.js'
    end
  end

  def me_edit
  end

  private

    def set_user
      @user = User.find_by id: params[:id]
    end

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

end
