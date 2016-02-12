class CreateCocktails < ActiveRecord::Migration[5.0]
  def change
    create_table :cocktails do |t|
      t.string :name, null: false
      t.text :recipe, null: false
    end
    add_index :cocktails, :name, unique: true
  end
end
