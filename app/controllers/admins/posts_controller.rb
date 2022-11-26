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

  # def update
  # booleanがtrueの場合
  # @post = Post.find(params[:id])
  # if @post.post_history == true
  #   @post.post_history = false
  # redirect_to admins_posts_path
  # end

end
