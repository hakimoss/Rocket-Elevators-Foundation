class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.integer :author
      t.integer :customerid
      t.integer :buildingid
      t.integer :batteryid
      t.integer :columnid
      t.integer :elevatorid
      t.integer :employeeid
      t.datetime :startdate
      t.datetime :enddate
      t.string :result
      t.text :report
      t.string :status

      t.timestamps
    end
  end
end
