class AddBudgetSpendingToPaymentParts < ActiveRecord::Migration[5.1]
  def change
    add_reference :payment_parts, :budget_spending, foreign_key: true
  end
end
