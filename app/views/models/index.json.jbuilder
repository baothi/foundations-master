json.array!(@models) do |model|
  json.extract! model, :id, :name, :description, :square_footage
  json.url model_url(model, format: :json)
end
