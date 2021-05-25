json.array!(@client_images) do |client_image|
  json.extract! client_image, :id, :client_id, :stage_references
  json.url client_image_url(client_image, format: :json)
end
