class ApplicationController < ActionController::Base
   before_action :configure_sign_up_params,if: :devise_controller?

#会員
  def after_sign_in_path_for(resource)
    public_customers_mypage_path
  end
  def after_sign_out_path_for(resource)
    root_path
  end

   protected

def customer_state
  ## 【処理内容1】 入力されたemailからアカウントを1件取得
  @customer = Customer.find_by(email: params[:customer][:email])
  ## アカウントを取得できなかった場合、このメソッドを終了する
  return if !@customer
  ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
  if @customer.valid_password?(params[:customer][:password])
    if   !@customer.is_active
      redirect_to root_path
    end
  end

end

  #If you have extra params to permit, append them to the sanitizer.
   def configure_sign_up_params
     devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
   end

end
