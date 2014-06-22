class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many   :purchases

  validates  :description, :price, presence: true
  validates  :price, numericality: true
end
