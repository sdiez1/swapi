json.extract! movie, :id, :name, :year, :director, :producer, :episode, :created_at, :updated_at
json.url movie_url(movie, format: :json)
