class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.integer :user_id, :null => false
      t.integer :supporter_id, :null => false
      t.datetime :start_at
      t.datetime :end_at
      t.string :url_token
      t.integer :review_point
      t.text :greeting_message

      t.timestamps
    end
    add_index :works, :user_id
    add_index :works, :supporter_id
  end
end
