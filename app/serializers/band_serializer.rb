class BandSerializer < ActiveModel::Serializer
  attributes :id, :name,:count_albums, :sum_songs, :sum_size, :songs_per_album, :size_per_album, :size_per_song

  has_many :albums
  belongs_to :status
  belongs_to :genre

  def count_albums
    @object.albums.length
  end

  def sum_songs
    @object.albums.map{|i| i.qtd_songs }.sum
    # Album.where({ band_id: @object.id }).sum(:qtd_songs)
  end

  def sum_size
    @object.albums.map{|i| i.size }.sum
    # Album.where({ band_id: @object.id }).sum(:size)
  end

  def songs_per_album
    return 0 if count_albums.zero?

    (sum_songs.to_f / count_albums.to_f).floor(2)
  end

  def size_per_album
    return 0 if count_albums.zero?

    (sum_size / count_albums).floor(2)
  end

  def size_per_song
    return 0 if sum_songs.zero?

    (sum_size / sum_songs).floor(2)
  end
end
