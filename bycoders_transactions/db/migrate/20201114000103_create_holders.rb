class CreateHolders < ActiveRecord::Migration[5.2]
  def change
    create_table :holders do |t|
      t.string :cpf

      t.timestamps
    end
    add_index :holders, :cpf, unique: true
  end
end
