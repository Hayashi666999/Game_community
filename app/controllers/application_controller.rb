class ApplicationController < ActionController::Base
   before_action :configure_sign_up_params,if: :devise_controller?

#会員
  def after_sign_in_path_for(resource)
    @customer = Customer.find_by(email: params[:customer][:email])
    if !@customer
      reset_session
    end
    ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    if @customer.valid_password?(params[:customer][:password])
      if !@customer.is_active
        reset_session
        new_customer_session_path
      else
        public_customers_mypage_path
      end
    end

  end
  def after_sign_out_path_for(resource)
    
    root_path
  end

   protected


  #If you have extra params to permit, append them to the sanitizer.
   def configure_sign_up_params
     devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
   end

end
