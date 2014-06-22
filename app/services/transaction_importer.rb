require "csv"

class TransactionImporter
  def initialize(data_file)
    @data_file = data_file
  end

  attr_reader :data_file
  private     :data_file

  def import
    Purchase.transaction do
      purchases = CSV.open(data_file, col_sep: "\t", headers: true).map { |row|
        load_transaction(Transaction.new(row))
      }

      ImportSummary.new(purchases)
    end
  end

  def load_transaction(transaction)
    purchaser = Purchaser.find_or_create_by!(name: transaction.purchaser_name)
    merchant  = Merchant.find_or_create_by!(name: transaction.merchant_name,
                                            address: transaction.merchant_address)
    item      = Item.find_or_create_by!(description: transaction.item_description,
                                        price: transaction.item_price,
                                        merchant: merchant)
    Purchase.create!(quantity: transaction.purchase_count, item: item,
                     purchaser: purchaser)
  end
end
