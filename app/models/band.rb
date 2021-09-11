class Band < ApplicationRecord
  belongs_to :genre
  belongs_to :status
  belongs_to :user
end
