class Sneaker < ApplicationRecord
  include PgSearch::Model
  has_one_attached :image

  belongs_to :user
  validates :brand, presence: true
  validates :name, presence: true
  validates :size, presence: true
  validates :price, presence: true

  pg_search_scope :search,
    against: [ :name, :brand, :size ],
    using: {
      tsearch: { prefix: true }
    }
end
