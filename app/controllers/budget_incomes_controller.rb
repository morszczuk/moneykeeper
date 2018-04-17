class BudgetIncomesController < ApplicationController
  def create
    budget_income = BudgetIncome.new(budget_income_params)
    budget_income.budget_plan_id = params[:budget_plan_id]
    budget_income.save
    redirect_to budget_plans_path
  end

  def update
    budget_income = BudgetIncome.find(params[:id])
    budget_income.carrier = budget_income_params[:carrier] if budget_income_params[:carrier]
    budget_income.amount = budget_income_params[:amount] if budget_income_params[:amount]
    budget_income.description = budget_income_params[:description] if budget_income_params[:description]
    budget_income.save!
    redirect_to budget_plans_path
  end
  
  def destroy
    BudgetIncome.find(params[:id]).destroy!
    redirect_to budget_plans_path
  end

  private

  def budget_income_params
    params.require(:budget_income).permit(:amount, :carrier, :description, :budget_plan_id)
  end
end
