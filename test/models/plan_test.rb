require 'test_helper'

class PlanTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "payments should add up to plan total" do
    plan = plans(:one)
    plan.build_payments
    assert plan.payments_correct?
    assert plan.sum_payments == plan.total
  end
end
