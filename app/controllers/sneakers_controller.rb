class SneakersController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @sneakers = policy_scope(Sneaker).search(params[:query])
    else
      @sneakers = policy_scope(Sneaker)
    end
    @markers = @sneakers.geocoded.map do |sneaker|
      {
        lat: sneaker.latitude,
        lng: sneaker.longitude,
        info_window: render_to_string(partial: "info_window", locals: { sneaker: sneaker }),
        image_url: helpers.asset_url("baskets")
      }
    end
  end

  def show
    @sneaker = Sneaker.find(params[:id])
    authorize @sneaker
    @origin_path = request.env["HTTP_TURBOLINKS_REFERRER"]
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
    params.require(:sneaker).permit(:brand, :name, :size, :price, :image, :description, :address)
  end
end
