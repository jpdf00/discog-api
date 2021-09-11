class Album < ApplicationRecord
  belongs_to :band
  belongs_to :type
end
