class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum gender: {male:1, female:2}

  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships

  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

  has_many :messages
  has_many :groups
  has_many :match_users

#Footモデルとのアソシエーション
  has_many :visiting_foots, foreign_key: "user_id", class_name: "Foot", dependent: :destroy
  has_many :visitings, through: :visiting_foots
  has_many :coming_foots, foreign_key: "visitor_id", class_name: "Foot", dependent: :destroy
  has_many :comings, through: :coming_foots

#user_imageとのアソシエーション
  has_many :UserImages, foreign_key: "user_id"

  has_many :communities, through: :members, dependent: :destroy
  has_many :members


  belongs_to :residence,  optional: true
  belongs_to :alcohol,  optional: true
  belongs_to :smoke,  optional: true
  belongs_to :occupancy,  optional: true
  belongs_to :school,  optional: true
  belongs_to :body,  optional: true
  belongs_to :holiday,  optional: true
  belongs_to :living_with,  optional: true
  belongs_to :height,  optional: true
  belongs_to :age,  optional: true
  belongs_to :income,  optional: true

  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  def followered?(other_user)
    follower_relationships.find_by(follower_id: other_user.id)
  end

  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

  def matchers
    followings & followers
  end

end
