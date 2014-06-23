class ImportSessionDecorator < SimpleDelegator
  def purchases
    __getobj__.purchases.map { |p| PurchaseDecorator.new(p) }
  end
end
