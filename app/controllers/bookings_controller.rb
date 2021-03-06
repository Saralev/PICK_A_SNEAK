class BookingsController < ApplicationController
  before_action :set_sneaker, only: [:new, :create]

  def index
    @current_user_bookings = policy_scope(Booking)
  end

  def new
    @booking = Booking.new
    authorize(@booking)
  end

  def create
    @booking = Booking.new(booking_params)
    @user = current_user
    @booking.sneaker_id = @sneaker.id
    @booking.user_id = @user.id
     authorize(@booking)
    if @booking.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def update
    @booking = Booking.find(params[:id])
    authorize(@booking)
    @booking.update(booking_params)
  end

  def approve
    booking = Booking.find(params[:id])
    authorize(booking)
    booking.update(approved: true)
    redirect_to dashboard_path
  end

  def refuse
    booking = Booking.find(params[:id])
    authorize(booking)
    booking.update(approved: false)
    redirect_to dashboard_path
  end


  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :sneaker_id, :user_id, :approved)
  end

  def set_sneaker
    @sneaker = Sneaker.find(params[:sneaker_id])
  end
end
