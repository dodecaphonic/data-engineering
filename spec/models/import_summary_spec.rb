require_relative "../../app/models/import_summary"

RSpec.describe ImportSummary, type: :model do
  let(:products) {
    [double("purchase1", total: 10), double("purchase2", total: 5),
     double("purchase3", total: 22)]
  }

  subject { ImportSummary.new(products) }

  it "calculates the total gross revenue" do
    expect(subject.total_gross_revenue).to eq(37)
  end

  it "has the total of purchases imported" do
    expect(subject.imported_purchases).to eq(3)
  end
end
