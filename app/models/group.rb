class Group < ApplicationRecord
  has_many :messages
  has_many :users, through: :match_users
  has_many :match_users
end
