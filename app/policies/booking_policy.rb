class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.bookings
    end
  end

  def new?
    create?
  end

  def create?
    true
  end

  def approve?
    # le current_user est le propriétaire de la sneaker qu'on loue
    record.sneaker.user == user
  end
end
