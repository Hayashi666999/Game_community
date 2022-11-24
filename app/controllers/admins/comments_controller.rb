class Admins::CommentsController < ApplicationController

  def index
    redirect_to admins_post_path(params[:post_id])
  end

  def destroy
    comment = Comment.all
    comment.destroy if comment == current_customer
    redirect_to admins_post_path(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(post_id: params[:post_id], customer_id: current_customer.id)
  end

end
