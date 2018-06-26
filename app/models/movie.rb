class Movie < ApplicationRecord

  has_many :line_items


  validates :name, :genre, :image_url, :price, :duration, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :name, uniqueness: true
  validates :name, length: {maximum: 80, message: 'cannot exceed 80 chars'}
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|png|jpg)\Z}i,
    message: 'must be a URL for .gif, .png or .jpg image'}

end
