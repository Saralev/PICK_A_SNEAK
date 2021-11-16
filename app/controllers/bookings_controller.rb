class BookingsController < ApplicationController
  before_action :set_sneaker

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @user = current_user
    @booking.sneaker_id = @sneaker.id
    @booking.user_id = @user.id
    if @booking.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :sneaker_id, :user_id)
  end

  def set_sneaker
    @sneaker = Sneaker.find(params[:sneaker_id])
  end
end
