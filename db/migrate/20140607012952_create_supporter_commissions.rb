class CreateSupporterCommissions < ActiveRecord::Migration
  def change
    create_table :supporter_commissions do |t|
      t.integer :supporter_id, :null => false
      t.integer :commission_id, :null => false

      t.timestamps
    end
    add_index :supporter_commissions, :supporter_id
    add_index :supporter_commissions, :commission_id
  end
end
