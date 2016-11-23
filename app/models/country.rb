class Country < ApplicationRecord
  has_many :movies, dependent: :destroy

  validates :name, uniqueness: true, presence: true, length: {maximum: 100}
  ATTRIBUTES_PARAMS = :name

  scope :newest, -> {order(updated_at: :desc)}
end
