class CreateMixtures < ActiveRecord::Migration[5.0]
  def change
    create_table :mixtures do |t|
      t.integer :ingredient_id, foreign_key: true
      t.integer :cocktail_id, foreign_key: true
    end
    add_index :mixtures, :ingredient_id
    add_index :mixtures, :cocktail_id
    add_index :mixtures, [:cocktail_id, :ingredient_id], unique: true
  end
end
