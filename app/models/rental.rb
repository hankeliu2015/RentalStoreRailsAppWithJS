class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :tool

  # def self.available_to_rent? # replaced by instance method (available_for_rent? in the tool class.
  #   where(return: false).empty?
  # end

  def self.in_progress
    #binding.pry
    where("start_date <= ?", Date.today).where("return_date >= ?", Date.today).where(return: false)
  end

  def self.in_possession
    where(return: false).select do |rental|
      if rental.start_date.strftime("%m/%d/%Y") <= Date.today.strftime("%m/%d/%Y") && rental.return_date.strftime("%m/%d/%Y") >= Date.today.strftime("%m/%d/%Y")
        rental
      end
    end
  end

  # scope :in_progress, where("start_date <= ?", Date.today).where("return_date >= ?", Date.today).where(return: false)

  def self.overdue #no need the argument(user). chain this method after @user.retnals ActiveRecord::Relation object
    where("return_date < ?", Date.today).where(return: false) #where(user_id: user.id) can be done in users controller show
  end

  def overdued_dates
    (Date.today - self.return_date).to_i
  end

  def self.past_rentals
    where(return: true)
  end


end #end of class
