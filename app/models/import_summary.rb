class ImportSummary
  def initialize(purchases)
    @purchases = purchases
  end

  attr_reader :purchases
  private     :purchases

  def total_gross_revenue
    purchases.map(&:total).sum
  end

  def imported_purchases
    purchases.size
  end
end
