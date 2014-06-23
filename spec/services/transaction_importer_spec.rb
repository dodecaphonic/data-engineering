require "rails_helper"

RSpec.describe TransactionImporter, type: :service do
  subject { TransactionImporter.new(data_file) }

  describe "with a valid data file" do
    let(:data_file) { File.expand_path("../resources/example_input.tab", __dir__) }

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

  describe "with an invalid data file" do
    let(:data_file) { File.expand_path("../resources/botched_input.tab", __dir__) }

    it "fails and wraps the exception" do
      expect { subject.import }.to raise_error(TransactionImporterError)
    end
  end
end
