class Public::NicesController < ApplicationController

def index
@nices = current_customer.nices
end

def create
  @post_nice = Nice.new(customer_id: current_customer.id, post_id: params[:post_id])
  @post_nice.save
  redirect_to public_post_path(params[:post_id])
end

def destroy
  @post_nice = Nice.find_by(customer_id: current_customer.id, post_id: params[:post_id])
  pp '----------'
  pp @post_nice
  @post_nice.destroy
  redirect_to public_post_path(params[:post_id])
end

end
