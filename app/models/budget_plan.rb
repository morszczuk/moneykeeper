class BudgetPlan < ApplicationRecord
  has_many :budget_incomes
  has_many :budget_spendings

  def total_income
    budget_incomes.map(&:amount).inject(0) { |sum, x| sum + x }
  end

  def planned_amount
    budget_spendings.map(&:amount).inject(0) { |sum, x| sum + x }
  end

  def planned_saving
    total_income - planned_amount
  end

  def income_percentage(income)
    total_income == 0 ? 0 : (income.amount/total_income)*100
  end

  def spending_percentage(spending)
    total_income == 0 ? 0 : (spending.amount/planned_amount)*100
  end

  def planned_percentage
    total_income == 0 ? 0 : (planned_amount/total_income)*100
  end

  def food_remaining_amount
    food_spending = budget_spendings.where(category_id: Category.food_category.id).first
    food_spending.amount + food_spending.amount_payed
  end

  def self.current_month_plan
    BudgetPlan.where('extract(year  from month) = ?', Date.today.year).where('extract(month from month) = ?', Date.today.month).first
  end

  def self.days_remaining
    (Date.today.end_of_month - Date.today).to_i + 1
  end

  def self.food_portion
    current_plan = current_month_plan
    return 0 unless current_plan
    (current_plan.food_remaining_amount / days_remaining).round(2)
  end
end
