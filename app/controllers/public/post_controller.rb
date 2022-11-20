class Public::PostController < ApplicationController

  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
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


  def destroy
    @post_page = Post.find(params[:id])
    @post_page.destroy
    redirect_to public_customers_mypage_path
  end

def search

   @section_title = "「#{params[:search]}」の検索結果"
   @post = if params[:search].present?
             Post.where(['title LIKE ?', "%#{params[:search]}%"])
                # .paginate(page: params[:page], per_page: 12).recent
           else
             redirect_to post_page_path
           end
end

private
def post_params
  params.require(:post).permit(:genre_id,:nice,:title,:body,:customer_id)
end

end
