class PostsController < ApplicationController

  before_action :new_post, only: [:index]

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new post_params
    @post.user = current_user
    @post.save
  end

  private

    def new_post
      @post = Post.new
    end

    def post_params
      params.require(:post).permit(:photo, :url, :notes)
    end

end
