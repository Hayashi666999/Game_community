class Admins::CommentsController < ApplicationController

  def index
    redirect_to admins_post_path(params[:post_id])
  end

  def destroy
    comment = Comment.find(params[:id])
    @post = comment.post_id
    comment.destroy
    redirect_to admins_post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(post_id: params[:post_id], customer_id: current_customer.id)
  end

end
