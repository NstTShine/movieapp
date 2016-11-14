class RatingMovie < ApplicationRecord
  belongs_to :movie
  after_commit :update_rating_arevage

  ATTRIBUTES_PARAMS = [:id, :movie_id, :rating]

  private
  def update_rating_arevage
    movie = self.movie
    rating = RatingMovie.where(movie_id: self.movie_id).average(:rating).to_f
    movie.update_attributes rating: rating
  end
end
