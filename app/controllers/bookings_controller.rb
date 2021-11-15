class BookingsController < ApplicationController
  before_action :set_sneaker

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.sneaker = @sneaker
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
    @sneaker = Sneaker.find(params[:id])
  end
end
