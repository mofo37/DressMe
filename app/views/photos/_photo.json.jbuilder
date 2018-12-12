json.extract! photo, :id, :url, :front, :back, :created_at, :updated_at
json.url photo_url(photo, format: :json)
