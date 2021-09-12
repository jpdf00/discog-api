class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :name, :year, :qtd_songs, :size, :cover

  belongs_to :band
  belongs_to :type
end
