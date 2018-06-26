class LineItem < ApplicationRecord
  belongs_to :movie
  belongs_to :cart

  def total_price
    movie.price * quantity
  end
end
