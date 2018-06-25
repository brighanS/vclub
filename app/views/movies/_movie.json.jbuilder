json.extract! movie, :id, :name, :genre, :image_url, :price, :duration, :created_at, :updated_at
json.url movie_url(movie, format: :json)
