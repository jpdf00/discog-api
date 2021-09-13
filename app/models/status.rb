class Status < ApplicationRecord
  has_many :bands

  validates :name, presence: true, uniqueness: true
end
