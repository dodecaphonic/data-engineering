# Public: A Transaction in the imported format.
class Transaction
  # Public: Creates a Transaction from raw values, taking care of sanitizing
  # and converting data appropriately.
  #
  # values - A Hash-y object.
  def initialize(values)
    @purchaser_name = values.fetch("purchaser name")
    @item_description = values.fetch("item description")
    @item_price = BigDecimal(values.fetch("item price"))
    @purchase_count = Integer(values.fetch("purchase count"))
    @merchant_address = values.fetch("merchant address")
    @merchant_name = values.fetch("merchant name")
  end

  attr_reader :purchaser_name, :item_description, :item_price,
              :purchase_count, :merchant_address, :merchant_name
end
