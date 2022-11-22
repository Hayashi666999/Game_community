class Public::CommentsController < ApplicationController
  def index
    redirect_to public_post_path(params[:post_id])
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to public_post_path(params[:post_id])
    else
      @post = Post.find(params[:post_id])
      render 'public/post/show'
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy if comment.customer_id == current_customer.id
    redirect_to public_post_path(params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(post_id: params[:post_id], customer_id: current_customer.id)
  end
end
