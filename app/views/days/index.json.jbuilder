json.array!(@days) do |day|
  json.extract! day, :id, :date
  json.url day_url(day, format: :json)
end
