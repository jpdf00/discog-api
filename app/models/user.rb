class User < ApplicationRecord
  has_secure_password

  has_many :bands

  mount_uploader :avatar, AvatarUploader
end
