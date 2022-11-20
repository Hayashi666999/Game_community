class Post < ApplicationRecord

  belongs_to :customer
  has_many :nices, dependent: :destroy
  has_many :likes, through: :nices, source: :customer

def nices?(customer)
   #nices.where(customer_id: customer.id).exists?
   likes.exists?
end

end
