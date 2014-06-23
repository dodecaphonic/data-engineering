require "rails_helper"

RSpec.describe TransactionImporter, type: :service do
  let(:data_file) { File.expand_path("../resources/example_input.tab", __dir__) }

  subject { TransactionImporter.new(data_file) }

  it "imports transactions from the original format and calculates the gross revenue" do
    summary = subject.import
    expect(summary.total_gross_revenue).to eq(BigDecimal("95"))
    expect(summary.total_imported_purchases).to eq(4)

    expect(Purchaser.count).to eq(3)
    expect(Item.count).to eq(3)
    expect(Merchant.count).to eq(3)
    expect(Purchase.count).to eq(4)
  end
end
