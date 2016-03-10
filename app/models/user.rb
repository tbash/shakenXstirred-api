class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :user_cocktails
  has_many :cocktails, through: :user_cocktails
  has_many :inventories
  has_many :ingredients, through: :inventories
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: 'follower_id',
                                  dependent: :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships
  has_many :feeds

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

    self.feeds.create(content: "#{self.name} updated their inventory!!")
  end

  # Follows a user
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
    followee = active_relationships.last.followed
    self.feeds.create(content: "#{self.name} is now following #{followee.name}")
  end

  # Unfollows a user
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user
  def following?(other_user)
    following.include?(other_user)
  end

  def followers_feed
    user_ids = self.following.pluck(:id)
    Feed.where(user_id: user_ids)
  end
end
