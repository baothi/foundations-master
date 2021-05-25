json.array!(@stages) do |stage|
  json.extract! stage, :id, :name, :description, :start_date, :end_date
  json.url stage_url(stage, format: :json)
end
