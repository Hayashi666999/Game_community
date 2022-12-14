class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
         has_many :posts, dependent: :destroy
         has_many :nices, dependent: :destroy

has_many :nices, dependent: :destroy
has_many :likes, through: :nices, source: :post
has_many :comments, dependent: :destroy

end
