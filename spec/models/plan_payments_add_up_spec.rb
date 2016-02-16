require 'rails_helper'

RSpec.describe Payment, :type => :model do
  it "Creates payments that add up to the goal" do
    plan = Plan.create!(title: "Test Plan", total: 5000)
    plan.build_payments
    expect(plan.sum_payments).to eq(plan.total)
    expect(plan.payments_correct?).to be_truthy
  end
end