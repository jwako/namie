class AddAdressToWork < ActiveRecord::Migration
  def change
    add_column :works, :address, :string
  end
end
