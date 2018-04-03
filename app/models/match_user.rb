class MatchUser < ApplicationRecord
  belongs_to :group,optional: true
  belongs_to :user,optional: true
end
