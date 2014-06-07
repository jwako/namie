class AddNameToSupporterProfile < ActiveRecord::Migration
  def change
    add_column :supporter_profiles, :name, :string
  end
end
