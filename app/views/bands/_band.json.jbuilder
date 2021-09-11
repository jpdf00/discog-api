json.extract! band, :id, :name, :genre_id, :status_id, :user_id, :created_at, :updated_at
json.url band_url(band, format: :json)
