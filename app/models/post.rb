class Post < ApplicationRecord
  has_attached_file :image, styles: { medium: "600x600>", thumb: "100x100>" },
                    default_url: ""
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  belongs_to :user
  validates :image, presence: true
end
