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
  
  def build_payments
    inc = (self.total - 52) / 1326.0
    number_list = Hash.new
    index = 1

    52.times do
      number_list[index] = index.round
      index += inc
    end

    i = 1
    number_list.each do |x,payment|
      self.payments.create(
          amount: payment,
          inc: i
      )
      i += 1
    end
    self.correct_last_payment unless self.payments_correct?
  end
end
