class Sneaker < ApplicationRecord
  include PgSearch::Model
  has_one_attached :image

  belongs_to :user
  validates :brand, presence: true
  validates :name, presence: true
  validates :size, presence: true
  validates :price, presence: true
  validates :address, presence: true

  pg_search_scope :search,
    against: [ :name, :brand, :size, :address, :price],
    using: {
      tsearch: { prefix: true }
    }
    geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
