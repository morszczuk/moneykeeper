class CreateOperations < ActiveRecord::Migration[5.1]
  def change
    create_table :operations do |t|
      t.datetime :exec_date
      t.datetime :order_date
      t.string :operation_type
      t.string :description
      t.decimal :amount
      t.string :currency

      t.timestamps
    end

    add_index :operations, :description
  end
end
