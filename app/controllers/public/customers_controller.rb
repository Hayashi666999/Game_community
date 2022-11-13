class Public::CustomersController < ApplicationController

  def show

  end

  def edit
    @customer = current_customer
  end

  def unsubscribe
    @customer = current_customer
    @customer.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def update
      current_customer.update!(customer_params)
    redirect_to public_customers_mypage_path
  end

  private
def customer_params
  params.require(:customer).permit(:nickname, :email)
end

end
