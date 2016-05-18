class CreateInventories < ActiveRecord::Migration[5.0]
  def change
    create_table :inventories do |t|
      t.integer :user_id, foreign_key: true
      t.integer :ingredient_id, foreign_key: true

      t.timestamps
    end
    add_index :inventories, :user_id
    add_index :inventories, :ingredient_id
    add_index :inventories, [:user_id, :ingredient_id], unique: true
  end
end
