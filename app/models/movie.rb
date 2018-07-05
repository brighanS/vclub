# == Schema Information
#
# Table name: movies
#
#  id         :integer          not null, primary key
#  name       :string
#  genre      :string
#  image_url  :string
#  price      :decimal(, )
#  duration   :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
# genre: 'genre',image_url: 'image_url', price: 100, duration: 60

class Movie < ApplicationRecord

  has_many :line_items

  before_destroy :ensure_not_referenced

  private

  def ensure_not_referenced
    unless line_items.empty?
      errors.add(:base, 'Line Items present')
      throw :abort
    end
  end

  validates :name, :genre, :image_url, :price, :duration, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :name, uniqueness: true
  validates :name, length: {maximum: 80, message: 'cannot exceed 80 chars'}
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|png|jpg)\Z}i,
    message: 'must be a URL for .gif, .png or .jpg image'}

end
