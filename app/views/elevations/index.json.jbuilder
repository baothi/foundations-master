json.array!(@elevations) do |elevation|
  json.extract! elevation, :id, :name, :description
  json.url elevation_url(elevation, format: :json)
end
