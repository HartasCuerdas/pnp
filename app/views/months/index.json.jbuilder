json.array!(@months) do |month|
  json.extract! month, :id, :firstDay, :comment
  json.url month_url(month, format: :json)
end
