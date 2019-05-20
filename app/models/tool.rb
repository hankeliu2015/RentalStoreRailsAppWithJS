class Tool < ApplicationRecord

  has_many :rentals
  has_many :users, through: :rentals
  #validate :available_for_rent?

  def available_for_rent?
    rentals.where(return: false).empty?
  end

  def current_rental
    rentals.find_by(return: false)
  end

  def checkout?   #tool checkout is when rental checkout is true and return is false.
    # rentals.where(checkout: true).where(return: false)
    rentals.where("checkout = ? AND return = ?", true, false)
  end

  # def past_rental_date(user)
  #   Rental.past_rentals(self, user)
  # end # no need this method for past_rented-tools

end
