class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :sneaker

  validates :start_date, :end_date, :sneaker_id, :user_id, presence: true
end
