require 'rails_helper'

RSpec.describe ImportedPurchase, type: :model do
  it { should belong_to(:import_session) }
  it { should belong_to(:purchase) }
  it { should validate_presence_of(:line_number) }
  it { should validate_numericality_of(:line_number) }
end
