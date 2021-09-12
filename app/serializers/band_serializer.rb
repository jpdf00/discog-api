class BandSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :albums
  belongs_to :status
  belongs_to :genre
end
