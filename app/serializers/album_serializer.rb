class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :name, :year, :qtd_songs, :size, :size_per_song, :cover

  belongs_to :band
  belongs_to :type

  def size_per_song
    (@object.size / @object.qtd_songs).floor(2)
  end
end
