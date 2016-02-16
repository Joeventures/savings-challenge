require 'rails_helper'

RSpec.describe Payment, :type => :model do
  it "Creates payments that add up to the goal" do
    plan = Plan.create!(title: "Test Plan", total: 5000)
    plan.build_payments
    expect(plan.sum_payments).to eq(plan.total)
    expect(plan.payments_correct?).to be_truthy
    expect(plan.payments.find_by(inc: 1).amount).to eq(1)
    expect(plan.payments.find_by(inc: 5).amount).to eq(16)
    expect(plan.payments.find_by(inc: 25).amount).to eq(91)
    expect(plan.payments.find_by(inc: 52).amount).to eq(191)
  end
end