# == Schema Information
#
# Table name: line_items
#
#  id         :integer          not null, primary key
#  movie_id   :integer
#  cart_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  quantity   :integer          default(1)
#

class LineItem < ApplicationRecord
  belongs_to :movie
  belongs_to :cart

  def total_price
    movie.price * quantity
  end
end
