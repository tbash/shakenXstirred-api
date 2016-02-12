class UserSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :cocktails
  has_many :ingredients
  has_many :followers
  has_many :following
end
