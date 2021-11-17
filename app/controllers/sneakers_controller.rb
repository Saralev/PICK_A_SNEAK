class SneakersController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @sneakers = policy_scope(Sneaker).search(params[:query])
    else
      @sneakers = policy_scope(Sneaker)
    end
  end

  def show
    @sneaker = Sneaker.find(params[:id])
    authorize @sneaker
  end

  def new
    @sneaker = Sneaker.new
    authorize @sneaker
  end

  def create
    @sneaker = Sneaker.new(sneaker_params)
    authorize @sneaker
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
    params.require(:sneaker).permit(:brand, :name, :size, :price, :image, :description)
  end
end
