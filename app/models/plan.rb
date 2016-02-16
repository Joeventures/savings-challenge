class Plan < ActiveRecord::Base
  belongs_to :user
  has_many :payments, dependent: :destroy

  def sum_payments
    self.payments.sum(:amount)
  end

  def progress
    self.payments.where(complete: true).sum(:amount)
  end

  def progress_percent
    f = (progress.to_f / sum_payments.to_f) * 100
    f.to_i
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
  
  def build_payments
    inc = (self.total - 52) / 1326.0
    payment = 1
    52.times do |x|
      self.payments.create(
           amount: payment.round,
           inc: x + 1
      )
      payment += inc
    end
    self.correct_last_payment unless self.payments_correct?
  end
end
