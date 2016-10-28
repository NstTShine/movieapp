class Movie < ApplicationRecord
  belongs_to :category
  belongs_to :country
  has_many :comments
  has_many :likes

  validates :name, presence: true, uniqueness:true, length: {maximum: 50}
  validates :category_id, presence: true
  validates :country_id, presence: true
end
