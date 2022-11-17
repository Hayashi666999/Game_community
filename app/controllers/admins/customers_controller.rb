class Admins::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admins_customer_path
  end

  private
  def customer_params
      params.require(:customer).permit(:nickname,:email,:encrypted_password,:like_list,:is_active)
  end

end
