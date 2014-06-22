require 'rails_helper'

RSpec.describe Purchase, type: :model do
  it { should belong_to(:purchaser) }
  it { should belong_to(:item) }
end
