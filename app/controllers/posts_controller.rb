class PostsController < ApplicationController
  def new
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.page(params[:page]).per_page(20)
  end
end
