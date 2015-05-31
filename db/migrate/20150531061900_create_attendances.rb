class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.references :employee, index: true, foreign_key: true, null: false
      t.date :day, null: false
      t.datetime :entrance_at, null: false
      t.datetime :departure_at

      t.timestamps null: false
    end
    add_index :attendances, [:employee_id, :day], unique: true
    add_index :attendances, :entrance_at
    add_index :attendances, :departure_at
  end
end
