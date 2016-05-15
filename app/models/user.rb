class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_attached_file :avatar, styles: { medium: "600x600>", thumb: "100x100>" },
                    default_url: "http://d27rch7fw5pld4.cloudfront.net/default-thumb.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  has_many :user_cocktails, dependent: :destroy
  has_many :cocktails, through: :user_cocktails
  has_many :inventories, dependent: :destroy
  has_many :ingredients, through: :inventories
  has_many :saved_cocktails, dependent: :destroy
  has_many :saves, through: :saved_cocktails,
                   source:  :cockatail
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: 'follower_id',
                                  dependent: :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false },
                   format: { with: /\A[a-zA-Z0-9\-_]+\z/ }

  def update_cocktails
    cocktail_ids = Mixture.where(ingredient_id: ingredient_ids).pluck(:cocktail_id).uniq
    cocktails = Cocktail.where(id: cocktail_ids)
    can_make = []
    cocktails.each do |cocktail|
      if (cocktail.ingredients - self.ingredients).empty?
        can_make << cocktail
      end
    end

    self.cocktails = can_make
  end

  # Follows a user
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user
  def following?(other_user)
    following.include?(other_user)
  end

  # Saves a cocktail
  def save_cocktail(cocktail)
    saves.create(cocktail_id: cocktail.id)
  end

  # Unsaves a cocktail
  def unsave_cocktail(cocktail)
    saves.find_by(cocktail_id: cocktail.id).destroy
  end

  # Returns true if the current user saved the arg cocktail
  def saved_cocktail?(cocktail)
    saves.include?(cocktail)
  end
end
