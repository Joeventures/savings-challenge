class PaymentsController < ApplicationController
  def update
    payment = Payment.find(params[:id])
    payment.update complete: true, payment_date: Date.current

    PaymentMailer.deposit_email(current_user.email).deliver_later

    redirect_to plan_path(payment.plan)
  end
end