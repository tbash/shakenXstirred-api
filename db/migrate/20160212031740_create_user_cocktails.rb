class CreateUserCocktails < ActiveRecord::Migration[5.0]
  def change
    create_table :user_cocktails do |t|
      t.integer :user_id, foreign_key: true
      t.integer :cocktail_id, foreign_key: true

      t.timestamps
    end
    add_index :user_cocktails, :user_id
    add_index :user_cocktails, :cocktail_id
    add_index :user_cocktails, [:user_id, :cocktail_id], unique: true
  end
end
