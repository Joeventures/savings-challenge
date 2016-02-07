class PaymentMailer < ApplicationMailer
  def deposit_email(email)
    mail(to: email, subject: "You made a deposit.")
  end
end
