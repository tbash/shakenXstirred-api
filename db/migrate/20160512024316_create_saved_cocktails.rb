class CreateSavedCocktails < ActiveRecord::Migration[5.0]
  def change
    create_table :saved_cocktails do |t|
      t.integer :user_id
      t.integer :cocktail_id

      t.timestamps
    end
    add_index :saved_cocktails, :user_id
    add_index :saved_cocktails, :cocktail_id
    add_index :saved_cocktails, [:user_id, :cocktail_id], unique: true
  end
end
