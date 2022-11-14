class Public::PostController < ApplicationController
  
  def index
    @post = Post.all
  end
  
  def show
    @post = Post.find(params[:genre_id])
  end
  
  def post_page
    #@post_page = PostPpage.all
  end
  
private
def post_params
  params.require(:post).permit(:genre_id,:nice)
end
  
end
