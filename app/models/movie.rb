class Movie < ApplicationRecord
  searchkick word: [:name]
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

  ATTRIBUTES_PARAMS = [:name, :film_length, :image, :description, :rating,
    :category_id, :country_id]

  scope :in_category, -> category_id do
    where category_id: category_id if category_id.present?
  end
  scope :in_country, -> country_id do
    where country_id: country_id if country_id.present?
  end
end
