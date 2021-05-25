json.array!(@communities) do |community|
  json.extract! community, :id, :name, :address, :city, :province, :postal_code, :status
  json.url community_url(community, format: :json)
end
