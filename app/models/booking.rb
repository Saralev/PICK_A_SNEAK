class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :sneaker

  validates :start_date, :end_date, :approved, presence: true
end
