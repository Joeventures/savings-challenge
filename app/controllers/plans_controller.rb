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
      inc = (plan.total - 52) / 1326.0
      number_list = Hash.new
      index = 1

      52.times do
        number_list[index] = index.round
        index += inc
      end

      i = 1
      number_list.each do |x,payment|
        plan.payments.create(
                         amount: payment,
                         inc: i
        )
        i += 1
      end

      redirect_to root_path, alert: "Plan saved successfully."
    else
      redirect_to root_path, alert: "Plan did not save!"
    end
  end
end