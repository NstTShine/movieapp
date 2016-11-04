class Movie < ApplicationRecord
  paginates_per Settings.movie.per_page
  belongs_to :category
  belongs_to :country
  has_many :comments
  has_many :likes

  validates :name, presence: true, uniqueness:true, length: {maximum: 50}
  validates :category_id, presence: true
  validates :country_id, presence: true

  has_attached_file :image, styles: {medium: "400x600#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  ATTRIBUTES_PARAMS = [:name, :film_length, :image, :description, :rating]
end
