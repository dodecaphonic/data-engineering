require "rails_helper"

RSpec.describe ImportSession, type: :model do
  before do
    create_import_session(create_admin)
  end

  subject { ImportSession.first }

  it "calculates the total gross revenue" do
    expect(subject.total_gross_revenue).to eq(37)
  end

  it "has the total of purchases imported" do
    expect(subject.total_imported_purchases).to eq(3)
  end

  it "has an importer" do
    expect(subject.importer).to be_present
  end

  describe "associations" do
    it { should have_many(:imported_purchases) }
    it { should have_many(:purchases) }
    it { should belong_to(:importer) }
  end

  describe "validations" do
    it { should validate_presence_of(:data_file) }
  end
end
