class SneakersController < ApplicationController
  def index
    @sneakers = Sneakers.all
  end
end
