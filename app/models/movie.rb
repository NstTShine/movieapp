class Movie < ApplicationRecord
  searchkick
  paginates_per Settings.movie.per_page
  belongs_to :category
  belongs_to :country
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :rating_movies, dependent: :destroy
  enum kind: [:single_movie, :series_movie]

  validates :name, presence: true, uniqueness:true, length: {maximum: 50}
  validates :category_id, presence: true
  validates :country_id, presence: true

  has_attached_file :image, styles: {medium: "400x600#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  delegate :name, to: :category, prefix: true
  delegate :name, to: :country, prefix: true

  ATTRIBUTES_PARAMS = [:name, :film_length, :image, :description, :rating,
    :director, :category_id, :country_id, :link, :actors, :kind]

  scope :in_category, -> category_id do
    where category_id: category_id if category_id.present?
  end
  scope :in_country, -> country_id do
    where country_id: country_id if country_id.present?
  end

  scope :newest, -> {order updated_at: :desc, created_at: :desc}
end
