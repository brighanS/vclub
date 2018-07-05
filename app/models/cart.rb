# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  usrid      :integer
#  user_id    :integer          default(1)
#

class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  validates :user_id, presence: true


  def add_movie(movie)
    current_item = line_items.find_by(movie_id: movie.id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(movie_id: movie.id)
    end
    current_item
  end
def total_price
  line_items.to_a.sum {|item| item.total_price}
end


end
