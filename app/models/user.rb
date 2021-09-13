class User < ApplicationRecord
  has_secure_password

  has_many :bands

  mount_uploader :avatar, AvatarUploader

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: :not_an_email }, presence: true, uniqueness: true
  validates :username, presence: true

  scope :without_admins, -> { where(admin: false)}

  before_save :default_values

  private
    def default_values
      self.admin = false if self.admin.nil?
    end
end
