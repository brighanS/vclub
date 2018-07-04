class AddUsridToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :user_id, :integer, default: 1
  end
end
