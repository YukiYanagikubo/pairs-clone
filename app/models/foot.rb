class Foot < ApplicationRecord

  belongs_to :coming, class_name: "User", foreign_key: "user_id"
  belongs_to :visiting, class_name: "User", foreign_key: "visitor_id"


end
