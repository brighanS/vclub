require 'rails_helper'

RSpec.describe Cart, type: :model do
  it {should have_many(:line_items).dependent(:destroy)}

  it 'ensures USER_ID presence' do
    cart = Cart.new().save
    expect(cart).to eq(false)
  end
end
