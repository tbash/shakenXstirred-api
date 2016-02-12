class CreateMixtures < ActiveRecord::Migration[5.0]
  def change
    create_table :mixtures do |t|
      t.belongs_to :ingredient, foreign_key: true
      t.belongs_to :cocktail, foreign_key: true
    end
    add_index :mixtures, [:cocktail_id, :ingredient_id], unique: true
  end
end
