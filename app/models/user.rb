class User < ApplicationRecord
  has_many :products
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, :presence => true
  # validates :first_name, :presence => true
  # validates :last_name, :presence => true
end
