class AddIsFinishToWork < ActiveRecord::Migration
  def change
    add_column :works, :is_finished, :boolean
  end
end
