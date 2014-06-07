class CreateSupporterAreas < ActiveRecord::Migration
  def change
    create_table :supporter_areas do |t|
      t.integer :supporter_id, :null => false
      t.integer :area_id, :null => false

      t.timestamps
    end
    add_index :supporter_areas, :supporter_id
    add_index :supporter_areas, :area_id
  end
end
