class CocktailSerializer < ActiveModel::Serializer
  attributes :id, :name, :recipe

  has_many :ingredients
end
