json.extract! album, :id, :name, :year, :qtd_songs, :size, :cover, :band_id, :type_id, :created_at, :updated_at
json.url album_url(album, format: :json)
