class CreateFinancialOperationTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :financial_operation_types do |t|
      t.string :description
      t.integer :nature

      t.timestamps
    end
  end
end
