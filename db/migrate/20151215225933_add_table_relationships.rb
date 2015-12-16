class AddTableRelationships < ActiveRecord::Migration
  def change
    add_column :profiles, :user_id, :integer
    add_index :profiles, :user_id

    add_column :todo_lists, :user_id, :integer
    add_index :todo_lists, :user_id

    add_column :todo_items, :todo_list_id, :integer
    add_index :todo_items, :todo_list_id
  end
end
