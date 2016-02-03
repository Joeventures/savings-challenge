class PlansController < ApplicationController
  def create
    plan = current_user.plans.new
    plan.title = params[:plan][:title]
    plan.total = params[:plan][:total]
    if plan.save
      redirect_to root_path, alert: "Plan saved successfully."
    else
      redirect_to root_path, alert: "Plan did not save!"
    end
  end
end