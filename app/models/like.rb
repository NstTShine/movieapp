class Like < ApplicationRecord
  belongs_to :user, class_name: User.name
  belongs_to :movie, class_name: Movie.name
  validates :user_id, presence: true
  validates :movie_id, presence: true
end
