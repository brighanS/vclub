require 'rails_helper'

RSpec.describe Cart, type: :model do
  context 'Validation test for Cart' do
    it {should have_many(:line_items).dependent(:destroy)}
  end
end
