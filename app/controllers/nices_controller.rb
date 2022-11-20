class NicesController < ApplicationController
  
def index
  
end

def create
  @post_nice = PostNice.new(customer_id: current_customer.id, post_id: params[:post_id])
  @post_nice.save
  redirect_to public_post_index_path(params[:post_id])
end

def destroy
  @post_nice = PostNice.find_by(customer_id: current_customer.id, post_id: params[:post_id])
  @post_nice.destroy
  redirect_to public_customers_mypage_path(params[:post_id])
end

end
