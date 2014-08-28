json.array!(@weeks) do |week|
  json.extract! week, :id, :firstDay, :comment
  json.url week_url(week, format: :json)
end
