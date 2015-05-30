class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :cpf, null: false
      t.string :name, null: false

      t.timestamps null: false
    end
    add_index :employees, :cpf, unique: true
  end
end
