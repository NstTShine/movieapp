class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :film_length
      t.string :director
      t.text :description
      t.integer :category_id
      t.integer :country_id

      t.timestamps
    end
  end
end
