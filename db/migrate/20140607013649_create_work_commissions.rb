class CreateWorkCommissions < ActiveRecord::Migration
  def change
    create_table :work_commissions do |t|
      t.integer :work_id, :null => false, :index => true
      t.integer :commission_id, :null => false, :index => true

      t.timestamps
    end
    add_index :work_commissions, :work_id
    add_index :work_commissions, :commission_id
  end
end
