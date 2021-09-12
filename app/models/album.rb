class Album < ApplicationRecord
  belongs_to :band
  belongs_to :type

  mount_uploader :cover, CoverUploader
end
