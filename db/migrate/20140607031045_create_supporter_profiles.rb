class CreateSupporterProfiles < ActiveRecord::Migration
  def change
    create_table :supporter_profiles do |t|
      t.integer :user_id, :null => false
      t.string :profile_image
      t.text :description

      t.timestamps
    end
    add_index :supporter_profiles, :user_id
  end
end
