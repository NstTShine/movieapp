class CreateRatingMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :rating_movies do |t|
      t.integer :user_id
      t.integer :movie_id
      t.integer :rating

      t.timestamps
    end
  end
end
