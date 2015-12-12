class CreateTodoitems < ActiveRecord::Migration
  def change
    create_table :todoitems do |t|
      t.date :due_date
      t.string :title
      t.text :description
      t.boolean :complete

      t.timestamps null: false
    end
  end
end
