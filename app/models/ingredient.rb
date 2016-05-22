class Ingredient < ApplicationRecord
  has_many :mixtures
  has_many :cocktails, through: :mixtures
  has_many :inventories
  has_many :users, through: :inventories
  default_scope { order(name: :asc) }

  def self.search(q)
    where("name LIKE ?", "%#{q}%")
  end
end
