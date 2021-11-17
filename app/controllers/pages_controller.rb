class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end

  def dashboard
    @current_user_bookings = current_user.bookings
    query = "
              SELECT bookings.id
              FROM bookings
              INNER JOIN sneakers ON bookings.sneaker_id = sneakers.id
              INNER JOIN users ON sneakers.user_id = users.id
              WHERE
                users.id = #{current_user.id}
    "
    @bookings_ordered = ActiveRecord::Base.connection.execute(query)
    @user = current_user
  end
end
