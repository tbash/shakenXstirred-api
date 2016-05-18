class CocktailSerializer < ActiveModel::Serializer
  attributes :id, :name, :recipe, :number_of_saves
  has_many :ingredients

  def number_of_saves
    object.number_of_saves
  end
end
