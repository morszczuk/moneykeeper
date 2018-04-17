class CreateBudgetIncomes < ActiveRecord::Migration[5.1]
  def change
    create_table :budget_incomes do |t|
      t.decimal :amount
      t.integer :carrier
      t.text :description
      t.references :budget_plan, foreign_key: true

      t.timestamps
    end
  end
end
