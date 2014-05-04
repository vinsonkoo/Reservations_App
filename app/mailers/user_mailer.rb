class UserMailer < ActionMailer::Base
  default from: "vinsonkoo@gmail.com"

  def email(reservation)
  	@reservation = reservation
  	mail(to: @reservation.email, subject: 'A Reservation Has Been Made')
  end

  def confirmation_email(reservation)
  	@reservation = reservation
  	mail(to: @reservation.email, subject: 'Reservation Confirmation')
  end

	def cancellation_email(reservation)
  	@reservation = reservation
  	mail(to: @reservation.email, subject: 'Reservation Cancellation')
  end  


end
