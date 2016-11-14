class Category < ApplicationRecord
  has_many :movies

  validates :name, uniqueness: true, presence: true, length: {maximum: 100}

  ATTRIBUTES_PARAMS = :name
end
