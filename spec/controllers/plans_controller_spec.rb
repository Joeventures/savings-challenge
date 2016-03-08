require 'rails_helper'

RSpec.describe PlansController, type: :controller do
  context "total is less than 1378" do
    describe "create plan" do
      it "yells at you to create a plan with a higher total" do
        plan_count = Plan.count
        plan = Plan.create(title: "Test Title", total: 1000)
        expect(Plan.count).to eq(plan_count)
      end
    end
  end
end