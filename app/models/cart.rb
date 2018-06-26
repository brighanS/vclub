class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_movie(movie)
    current_item = line_items.find_by(movie_id: movie.id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(movie_id: movie.id)
    end
    current_item
  end
end
