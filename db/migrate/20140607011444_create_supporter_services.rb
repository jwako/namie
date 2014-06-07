class CreateSupporterServices < ActiveRecord::Migration
  def change
    create_table :supporter_services do |t|
      t.integer :supporter_id, :null => false
      t.integer :week_id, :null => false
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
    add_index :supporter_services, :supporter_id
    add_index :supporter_services, :week_id
  end
end
