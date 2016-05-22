class Ingredient < ApplicationRecord
  has_many :mixtures
  has_many :cocktails, through: :mixtures
  has_many :inventories
  has_many :users, through: :inventories
  default_scope { order(name: :asc) }

  def self.search(q, p = 0)
    p_size = 10
    q.downcase!
    p *= p_size
    where("lower(name) LIKE ?", "%#{q}%").limit(10).offset(p)
  end
end
