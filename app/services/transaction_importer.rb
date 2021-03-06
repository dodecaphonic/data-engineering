require "csv"

class TransactionImporterError < StandardError; end

class TransactionImporter
  def initialize(data_file, importer)
    @data_file = data_file
    @importer  = importer
  end

  attr_reader :data_file, :importer
  private     :data_file, :importer

  def import
    Purchase.transaction do
      import_session = ImportSession.new(importer: importer)
      data           = CSV.open(data_file, col_sep: "\t", headers: true)

      data.each.with_index do |row, line|
        purchase = load_transaction(Transaction.new(row))
        import_session.imported_purchases.build(line_number: line, purchase: purchase)
      end

      import_session.data_file = open(data_file)
      import_session.save!
      import_session
    end
  rescue
    raise TransactionImporterError
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
