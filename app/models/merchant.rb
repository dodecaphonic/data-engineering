class Merchant < ActiveRecord::Base
  has_many :items
  has_many :purchases, through: :items

  validates :name, :address, presence: true
end
