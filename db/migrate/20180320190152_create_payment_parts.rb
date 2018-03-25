class CreatePaymentParts < ActiveRecord::Migration[5.1]
  def change
    create_table :payment_parts do |t|
      t.decimal :amount
      t.references :category, foreign_key: true
      t.references :operation, foreign_key: true
      t.text :labels, array: true, default: []

      t.timestamps
    end
  end
end
