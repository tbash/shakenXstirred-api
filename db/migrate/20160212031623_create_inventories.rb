class CreateInventories < ActiveRecord::Migration[5.0]
  def change
    create_table :inventories do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :ingredient, foreign_key: true
    end
    add_index :inventories, [:user_id, :ingredient_id], unique: true
  end
end
