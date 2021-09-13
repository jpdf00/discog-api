class Album < ApplicationRecord
  belongs_to :band
  belongs_to :type

  mount_uploader :cover, CoverUploader

  validates :name, presence: true, uniqueness: true
  validates :year, numericality: true
  validates :qtd_songs, numericality: true
  validates :size, numericality: true
end
