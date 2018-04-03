class Relationship < ApplicationRecord

  belongs_to :follower, class_name: "User", foreign_key: "follower_id"
  belongs_to :following, class_name: "User", foreign_key: "following_id"

  validates :follower_id, presence: true
  validates :following_id, presence: true

end
