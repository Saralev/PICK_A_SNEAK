class AddReviewsAndRatingsToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :review, :text
    add_column :bookings, :rating, :float
  end
end
