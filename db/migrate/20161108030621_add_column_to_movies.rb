class AddColumnToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :link, :string
    add_column :movies, :actors, :string
    add_column :movies, :kind, :integer
  end
end
