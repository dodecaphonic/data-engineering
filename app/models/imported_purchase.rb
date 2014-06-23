class ImportedPurchase < ActiveRecord::Base
  belongs_to :import_session
  belongs_to :purchase

  validates :line_number, presence: true
  validates :line_number, numericality: true
end
