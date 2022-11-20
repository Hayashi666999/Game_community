class Admins::SessionsController < ApplicationController
#管理者
  def after_sign_in_path_for(resource)
    admins_path
  end

  def after_sign_out_path_for(resource)
    admins_path
  end
end