class Post < ApplicationRecord

  belongs_to :customer
  has_many :nices, dependent: :destroy

def nice?(customer)
   nices.where(customer_id: customer.id).exists?
end

end
