class Supports::MovieSupport
  attr_accessor :movie, :rating_movie, :total_rater

  def initialize movie, rating_movie, total_rater
    @movie = movie
    @rating_movie = rating_movie
    @total_rater = total_rater
  end

  def movie_description
    @movie.description
  end

  def movie_rating
    @movie.rating
  end
end
