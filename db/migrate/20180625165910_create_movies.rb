class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :genre
      t.string :image_url
      t.decimal :price
      t.decimal :duration

      t.timestamps
    end
  end
end
