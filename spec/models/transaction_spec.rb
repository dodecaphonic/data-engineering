require_relative "../../app/models/transaction"

RSpec.describe Transaction, type: :model do
  let(:raw_data) {
    {
      "purchaser name" => "Joe McGee",
      "item description" => "$15 of bubblegum for $50",
      "item price" => "50.0",
      "purchase count" => "5",
      "merchant address" => "123 Tristana Ln",
      "merchant name" => "Jane Nguyen"
    }
  }

  it "wraps raw values and converts data appropriately" do
    row = Transaction.new(raw_data)
    expect(row.purchaser_name).to eq(raw_data["purchaser name"])
    expect(row.item_description).to eq(raw_data["item description"])
    expect(row.item_price).to eq(BigDecimal("50.0"))
    expect(row.purchase_count).to eq(5)
    expect(row.merchant_address).to eq(raw_data["merchant address"])
    expect(row.merchant_name).to eq(raw_data["merchant name"])
  end

  it "fails if values are missing" do
    raw_data.each do |col, v|
      expect {
        missing_data = raw_data.select { |k, _| k != col }
        Transaction.new(missing_data)
      }.to raise_error(KeyError)
    end
  end
end
