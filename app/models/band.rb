class Band < ApplicationRecord
  has_many :albums
  belongs_to :genre
  belongs_to :status
  belongs_to :user
end
