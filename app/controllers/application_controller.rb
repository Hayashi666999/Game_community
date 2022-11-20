class ApplicationController < ActionController::Base
   before_action :configure_sign_up_params,if: :devise_controller?

#会員
  def after_sign_in_path_for(resource)
    public_customers_mypage_path
  end
  def after_sign_out_path_for(resource)
    root_path
  end

#管理者
  def after_sign_in_path_for(resource)
    admins_path
  end
  def after_sign_out_path_for(resource)
    admins_path
  end

   protected

  #If you have extra params to permit, append them to the sanitizer.
   def configure_sign_up_params
     devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
   end

end
