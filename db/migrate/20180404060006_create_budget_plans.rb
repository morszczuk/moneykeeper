class CreateBudgetPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :budget_plans do |t|
      t.date :month

      t.timestamps
    end
  end
end
