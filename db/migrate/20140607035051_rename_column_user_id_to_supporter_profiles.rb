class RenameColumnUserIdToSupporterProfiles < ActiveRecord::Migration
  def change
  	rename_column :supporter_profiles, :user_id, :supporter_id
  end
end
