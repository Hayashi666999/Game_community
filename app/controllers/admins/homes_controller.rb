class Admins::HomesController < ApplicationController
  
  def top
    @customers = Customer.all
  end
  
end
