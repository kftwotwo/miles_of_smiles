class Product < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  validates :name, :presence => true
  validates :description, :presence => true
  validates :price, :presence => true
end
