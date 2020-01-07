class NotifyMailer < ApplicationMailer
  def rental_confirmation(rental)
    @rental = rental
    @tool = rental.tool
    @user = rental.user
    mail(
      to: @user.email,
      # content_type: "text/plain",
      subject: "Thanks #{@user.username} for renting #{@tool.name}"
    )
  end

  def return_reminder(rental)
    @rental = rental
    @tool = rental.tool
    @user = rental.user
    mail(
      to: @user.email,
      # content_type: "text/plain",
      subject: "Return reminder for tool #{@tool.name}, Please renew or return"
    )
  end

  def monthly_report(rentals, user)
    @rentals = rentals
    @user = user
    mail(
      to: @user.email,
      # content_type: "text/plain",
      subject: "Monthly Rental Report for #{@user}"
    )
  end

  def welcome_email(user)
    @user = user
    mail(
      to: @user.email,
      subject: "Welcome to Henry's Rental Store"
    )
  end

end
