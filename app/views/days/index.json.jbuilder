json.array!(@days) do |day|
  json.extract! day, :id, :date, :oTotal, :dTotal, :wr
  json.url day_url(day, format: :json)
end
