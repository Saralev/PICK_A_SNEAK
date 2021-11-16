class Sneaker < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  validates :brand, presence: true
  validates :name, presence: true
  validates :size, presence: true
  validates :price, presence: true

end
