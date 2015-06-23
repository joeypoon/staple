class UsersController < ApplicationController

  before_action :new_post

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      login @user
      flash.now[:notice] = "Welcome to Staple, #{@user.username}!"
      @posts = Post.all
    end
  end

  def show
    set_user
    @posts = @user.posts
    @posts += Post.where(id: @user.stapled)
    @posts = @posts.uniq.sort_by(&:created_at).reverse
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
    if current_user.save!
      flash.now[:notice] = 'Stapled'
    else
      flash.now[:alert] = 'Fail'
    end
  end

  def unstaple_post
    @post = Post.find_by id: params[:post_id]
    current_user.stapled.delete @post.id
    if current_user.save!
      flash.now[:notice] = 'Unstapled'
    else
      flash.now[:alert] = 'Fail'
    end
    render 'users/staple_post'
  end

  def my_stapled
    @posts = Post.where(id: current_user.stapled)
  end

  private

    def set_user
      @user = User.find_by id: params[:id]
    end

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

end
