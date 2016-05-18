class CommentSerializer < ActiveModel::Serializer
  attributes :id, :caption
  has_one :user
  has_one :post
end
