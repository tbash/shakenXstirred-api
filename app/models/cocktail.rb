class Cocktail < ApplicationRecord
  has_many :mixtures
  has_many :ingredients, through: :mixtures
  has_many :user_cocktails
  has_many :users, through: :user_cocktails
  has_many :saved_cocktails
  after_initialize :generate_mix, if: :new_record?
  default_scope { order(name: :asc) }

  def self.search(q)
    where("name LIKE ? OR recipe LIKE ?", "%#{q}%", "%#{q}%")
  end

  def number_of_saves
    saved_cocktails.size
  end

  private
    def generate_mix
      Ingredient.all.each do |ingredient|
        if self.recipe.match(/#{ingredient.name}/)
          self.ingredients << ingredient
        end
      end
    end
end
