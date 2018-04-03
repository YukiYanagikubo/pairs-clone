class Community < ApplicationRecord
  has_many :users, through: :members, dependent: :destroy
  has_many :members

  accepts_nested_attributes_for :users

  enum category: {music:1, movie:2, entertainment:3, game:4, book:5, art:6, sport:7, moter:8, trip:9, diy:10, animal:11, pc:12, fashion:13, cook:14, fortune:15, hobby:16, marry:17, spiritual:18, life:19, health:20, housekeep:21, social:22, school:23, organization:24, occupation:25, qualification:26, business:27 }

  mount_uploader :image, ImageUploader
  validates :community_name, presence: true, length: { maximum: 20 }
  validates :category, presence: true
  validates :image, presence: true

  # コミュニティ名による絞り込み
  scope :get_by_community_name, ->(community_name) {
    where("community_name like ?", "%#{community_name}%")
  }
  # カテゴリによる絞り込み
  scope :get_by_category, ->(category) {
    where(category: category)
  }

end
