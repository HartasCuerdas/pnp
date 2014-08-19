json.array!(@ods) do |od|
  json.extract! od, :id, :instant, :o, :d, :timekey
  json.url od_url(od, format: :json)
end
