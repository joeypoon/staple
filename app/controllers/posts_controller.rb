class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    # TODO Not validating presence
    @post = Post.new post_params
    if @post.save!
      redirect_to root_path, notice: 'success'
    else
      flash.now[:alert] = 'you have failed to achieve victory'
      render :new
    end
  end

  private

    def post_params
      params.require(:post).permit(:photo)
    end

end
