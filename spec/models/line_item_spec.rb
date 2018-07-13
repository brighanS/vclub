require 'rails_helper'

#Strcuture: movie_id: 1, cart_id: 1, quantity: 1

RSpec.describe LineItem, type: :model do
  context 'Validation tests for LineItem' do

    it 'ensures MOVIE_ID presence' do
      line_item = LineItem.new(cart_id: 1, quantity: 1).save
      expect(line_item).to eq(false)
    end

    it 'ensures CART_ID presence' do
      line_item = LineItem.new(movie_id: 1, quantity: 1).save
      expect(line_item).to eq(false)
    end

    it 'ensures QUANTITY presence' do
      line_item = LineItem.new(movie_id: 1, cart_id: 1).save
      expect(line_item).to eq(false)
    end


    it {should belong_to(:movie)}

    it {should belong_to(:cart)}

  end
end
