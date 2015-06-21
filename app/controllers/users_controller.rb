class UsersController < ApplicationController

  before_action :new_post

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      login @user
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
      render 'users/fail_update'
    end
  end

  def me_edit
  end

  def staple_post
    @post = Post.find_by id: params[:post_id]
    current_user.stapled << @post.id
    if current_user.save
      flash.now[:notice] = 'Stapled'
    else
      flash.now[:alert] = 'Fail'
    end
  end

  private

    def set_user
      @user = User.find_by id: params[:id]
    end

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

end
