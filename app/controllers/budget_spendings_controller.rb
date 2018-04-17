class BudgetSpendingsController < ApplicationController
  def create
    budget_spending = BudgetSpending.new(budget_spending_params)
    budget_spending.budget_plan_id = params[:budget_plan_id]
    budget_spending.save
    redirect_to budget_plans_path
  end

  def update
    budget_spending = BudgetSpending.find(params[:id])
    budget_spending.category_id = budget_spending_params[:category_id] if budget_spending_params[:category_id]
    budget_spending.amount = budget_spending_params[:amount] if budget_spending_params[:amount]
    budget_spending.save!
    redirect_to budget_plans_path
  end

  def destroy
    BudgetSpending.find(params[:id]).destroy!
    redirect_to budget_plans_path
  end
  
  private

  def budget_spending_params
    params.require(:budget_spending).permit(:amount, :category_id, :budget_plan_id)
  end
end
