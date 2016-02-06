class PaymentsController < ApplicationController
  def update
    payment = Payment.find(params[:id])
    payment.update complete: true, payment_date: Date.current
    redirect_to plan_path(payment.plan)
  end
end