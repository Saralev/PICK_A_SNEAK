class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end

  def dashboard
    @current_user_bookings = current_user.bookings
    @bookings_ordered = Booking.joins(sneaker: :user)
                               .where(bookings: {approved: nil}, sneakers: {user: current_user})
    @user = current_user
  end
end
