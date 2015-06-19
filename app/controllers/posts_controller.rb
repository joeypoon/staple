class PostsController < ApplicationController

  def index
    new_post
    set_posts
  end

  def create
    @post = Post.new post_params
    @post.user = current_user
    @post.save
    set_posts
  end

  def staple_modal
    @post = Post.find params[:id]
  end

  private

    def new_post
      @post = Post.new
    end

    def set_posts
      @posts = Post.all.order('created_at desc').page(params[:page])
    end

    def post_params
      params.require(:post).permit(:photo, :url, :notes)
    end

end
