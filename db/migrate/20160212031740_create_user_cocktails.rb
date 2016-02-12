class CreateUserCocktails < ActiveRecord::Migration[5.0]
  def change
    create_table :user_cocktails do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :cocktail, foreign_key: true

      t.timestamps
    end
    add_index :user_cocktails, [:user_id, :cocktail_id], unique: true
  end
end
