json.array!(@upgrades) do |upgrade|
  json.extract! upgrade, :id
  json.url upgrade_url(upgrade, format: :json)
end
