class UserSerializer < ActiveModel::Serializer
  attributes :name, :thumb_avatar_url, :med_avatar_url
  has_many :cocktails
  has_many :ingredients

  def thumb_avatar_url
    object.avatar.url(:thumb)
  end

  def med_avatar_url
    object.avatar.url(:medium)
  end
end

