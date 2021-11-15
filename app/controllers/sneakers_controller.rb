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
end
