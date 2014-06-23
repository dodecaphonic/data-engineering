class PurchaseDecorator < SimpleDelegator
  def item_description
    item.description
  end

  def item_price
    item.price
  end

  def merchant_name
    item.merchant.name
  end

  def merchant_address
    item.merchant.address
  end
end
