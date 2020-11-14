class CreateFinancialOperations < ActiveRecord::Migration[5.2]
  def change
    create_table :financial_operations do |t|
      t.datetime :ocurred_in
      t.decimal :amount, precision: 8, scale: 2, default: 0
      t.references :store, foreign_key: true
      t.references :holder, foreign_key: true
      t.references :financial_operation_type, foreign_key: true

      t.timestamps
    end
  end
end
