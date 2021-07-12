class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.belongs_to :author, foreign_key: {to_table: :employees}
      t.belongs_to :customer, foreign_key: {to_table: :customers}
      t.belongs_to :building, foreign_key: {to_table: :buildings}
      t.belongs_to :battery, foreign_key: {to_table: :batteries}
      t.belongs_to :column, foreign_key: {to_table: :columns}
      t.belongs_to :elevator, foreign_key: {to_table: :elevators}
      t.belongs_to :employee, foreign_key: {to_table: :employees}
      t.datetime :start_date
      t.datetime :end_date
      t.string :result
      t.string :report
      t.string :status

      t.timestamps
    end
  end
end