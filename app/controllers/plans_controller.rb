class PlansController < ApplicationController
  def create
    if params[:plan][:total].to_i < 1378
      redirect_to root_path, alert: "Please enter a savings goal higher than 1378."
      return
    end
    plan = current_user.plans.new
    plan.title = params[:plan][:title]
    plan.total = params[:plan][:total]
    if plan.save
      plan.build_payments
      redirect_to root_path, alert: "Plan saved successfully."
    else
      redirect_to root_path, alert: "Plan did not save!"
    end
  end
end