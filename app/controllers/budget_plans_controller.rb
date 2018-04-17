class BudgetPlansController < ApplicationController
  def create
    month = Date.new budget_plan_params[:month].to_date.year, budget_plan_params[:month].to_date.month
    BudgetPlan.create month: month
  end

  def index
    @budget_plans = BudgetPlan.all
  end

  private

  def budget_plan_params
    params.require(:budget_plan).permit(:month)
  end
end
