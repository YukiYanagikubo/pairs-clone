class UserImage < ApplicationRecord

  belongs_to :User, optional: true

  mount_uploader :content, ImageUploader

end
