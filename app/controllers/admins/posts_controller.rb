class Admins::PostsController < ApplicationController

  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def post_history
    @post = Post.all
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admins_posts_path
  end

end
