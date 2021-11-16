class SneakersController < ApplicationController
  def index
    @sneakers = Sneaker.all
    raise
  end

  def show
    @sneaker = Sneaker.find(params[:id])
  end

  def new
    @sneaker = Sneaker.new
  end

  def create
    @sneaker = Sneaker.new(sneaker_params)
    @user = current_user
    @sneaker.user_id = @user.id
    if @sneaker.save
      redirect_to sneaker_path(@sneaker)
    else
      render :new
    end
  end

  private

  def sneaker_params
    params.require(:sneaker).permit(:brand, :name, :size, :price)
  end
end
