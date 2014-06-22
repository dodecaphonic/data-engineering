class Purchase < ActiveRecord::Base
  belongs_to :item
  belongs_to :purchaser

  validates :quantity, presence: true
  validates :quantity, numericality: true

  def total
    quantity * item.price
  end
end
