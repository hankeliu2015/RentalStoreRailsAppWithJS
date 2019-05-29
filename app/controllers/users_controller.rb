class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: :show


  def show
    # use current_user to replace user id in URL. repalce all @user with current_user

      @in_prossession = current_user.rentals.in_progress
      # binding.pry
      @scheduled_rentals = current_user.rentals.scheduled

      @forget_checkout = current_user.rentals.forget_checkout

      @overdue_items = current_user.rentals.overdued
      # the following code no needed. User show only only show a link for completed.
      # @past_rented_tools = current_user.rentals.completed
  end

  private
  def set_user
    @user = User.find_by(id: params[:id])
  end
end
