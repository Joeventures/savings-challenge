require 'rails_helper'

RSpec.describe PlansController, type: :controller do
  context "total is less than 1378" do
    describe "create plan" do
      it "yells at you to create a plan with a higher total" do
        plan_count = Plan.count
        Plan.create(title: "Test Title", total: 1000)
        expect(Plan.count).to eq(plan_count)
        expect(:alert).to be_present
      end
    end
  end

  context "total is equal to or greater than 1378" do
    describe "create plan" do
      it "creates plans" do
        plan_count = Plan.count
        Plan.create(title: "Exactly 1378", total: 1378)
        expect(Plan.count).to eq(plan_count + 1)
        Plan.create(title: "More than 1378", total: 5000)
        expect(Plan.count).to eq(plan_count + 2)
      end
    end
  end

  context "a title is present" do
    describe "create plan" do
      it "creates a plan" do
        plan_count = Plan.count
        Plan.create(title: "Hey a title", total: 5000)
        expect(Plan.count).to eq(plan_count + 1)
      end
    end
  end

  context "a title is not present" do
    describe "create plan" do
      it "yells at you to create a plan with a title" do
        plan_count = Plan.count
        Plan.create(total: 5000)
        expect(Plan.count).to eq(plan_count)
        expect(:alert).to be_present
      end
    end
  end

  context "showing a plan" do
    describe "a new plan" do
      it "shows a plan with no payments made"
    end

    describe "an old plan" do
      it "shows a plan with several payments made"
    end
  end
end