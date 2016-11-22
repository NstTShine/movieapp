class Supports::MovieSupport
  attr_accessor :movie, :rating_movie, :total_rater, :total_comments

  def initialize movie, rating_movie, total_rater, total_comments
    @movie = movie
    @rating_movie = rating_movie
    @total_rater = total_rater
    @total_comments = total_comments
  end

  def movie_description
    @movie.description
  end

  def movie_rating
    @movie.rating
  end
end
