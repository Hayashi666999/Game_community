class Post < ApplicationRecord

  belongs_to :customer
  has_many :nices, dependent: :destroy

end
