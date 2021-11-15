class SneakersController < ApplicationController
  def index
    @sneakers = Sneakers.all
  end

  def show
    @sneaker = Sneaker.find(params[:id])
  end

  def new
    @sneaker = Sneaker.new
  end

  def create
    @sneaker = Sneaker.new(sneaker_params)
    # we need `restaurant_id` to associate review with corresponding restaurant
    if @sneaker.save
      redirect_to sneaker_path(@Sneaker)
    else
      render :new
    end
  end

  private

  def sneaker_params
    params.require(:sneaker).permit(:brand, :name, :size, :price)
  end
end
