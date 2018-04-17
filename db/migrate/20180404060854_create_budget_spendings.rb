class CreateBudgetSpendings < ActiveRecord::Migration[5.1]
  def change
    create_table :budget_spendings do |t|
      t.references :category, foreign_key: true
      t.decimal :amount
      t.references :budget_plan, foreign_key: true

      t.timestamps
    end
  end
end
