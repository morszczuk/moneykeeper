class CreateLabelFilters < ActiveRecord::Migration[5.1]
  def change
    create_table :label_filters do |t|
      t.string :label

      t.timestamps
    end
  end
end
