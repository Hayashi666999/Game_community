class Public::PostController < ApplicationController

  def index
    @post = Post.all
  end

  def show
    @post = Post.where(id: params[:id])
  end

  def post_page
    @post_page = Post.all
    @post = Post.new
  end

  def create
    @post_page = Post.new(post_params)
    @post_page.customer_id = current_customer.id
    if @post_page.save
      redirect_to public_post_page_path, flash: { notice: 'You have created book successfully.' }
    else
    @post_page = current_customer
    @post_page = Post.all
      render :index
    end
  end



private
def post_params
  params.require(:post).permit(:genre_id,:nice,:title,:body,:customer_id)
end

end
