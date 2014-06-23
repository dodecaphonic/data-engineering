class ImportSession < ActiveRecord::Base
  has_many :imported_purchases
  has_many :purchases, through: :imported_purchases
  belongs_to :importer, class_name: "Admin", foreign_key: "admin_id"

  has_attached_file :data_file
  validates_attachment_content_type :data_file, :content_type => %r{\Atext/}

  validates :data_file, presence: true

  def total_gross_revenue
    purchases.map(&:total).sum
  end

  def total_imported_purchases
    imported_purchases.count
  end
end
