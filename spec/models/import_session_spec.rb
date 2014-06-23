require "rails_helper"

RSpec.describe ImportSession, type: :model do
  before do
    bogus_data_file = StringIO.new("nothingtoseehere")
    import_session  = ImportSession.create!(data_file: bogus_data_file)

    merchant  = Merchant.create!(name: "Foo Store", address: "1 Bar St.")
    purchaser = Purchaser.create!(name: "Buysalot Moneypenny")
    items     = [10, 22, 5].map.with_index { |v, i|
      Item.create!(description: "China Import #{i}", price: v, merchant: merchant)
    }

    items.each.with_index do |item, line|
      purchase = Purchase.create!(item: item, quantity: 1, purchaser: purchaser)
      ImportedPurchase.create!(import_session: import_session,
                               purchase: purchase, line_number: line)
    end
  end

  subject { ImportSession.first }

  it "calculates the total gross revenue" do
    expect(subject.total_gross_revenue).to eq(37)
  end

  it "has the total of purchases imported" do
    expect(subject.total_imported_purchases).to eq(3)
  end

  describe "associations" do
    it { should have_many(:imported_purchases) }
    it { should have_many(:purchases) }
  end

  describe "validations" do
    it { should validate_presence_of(:data_file) }
  end
end
