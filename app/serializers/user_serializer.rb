class UserSerializer < ActiveModel::Serializer
  attributes :name
  has_many :cocktails
  has_many :ingredients
end
