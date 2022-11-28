class Post < ApplicationRecord

  belongs_to :customer
  has_many :nices, dependent: :destroy
  has_many :likes, through: :nices, source: :customer
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true


def nices?(customer)
   nices.where(customer_id: customer.id).exists?
end

end
