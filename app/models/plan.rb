class Plan < ActiveRecord::Base
  belongs_to :user
  has_many :payments

  def sum_payments
    self.payments.sum(:amount)
  end

  def payments_correct?
    self.total == sum_payments
  end

  def correct_last_payment
    inc = self.payments.last.inc
    self.payments.last.destroy
    should_be = self.total - sum_payments
    self.payments.create(
                     amount: should_be,
                     inc: inc
    )
  end
end
