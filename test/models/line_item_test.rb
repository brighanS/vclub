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

require 'test_helper'

class LineItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
