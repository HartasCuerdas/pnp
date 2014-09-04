json.array!(@ods) do |od|
  json.extract! od, :id, :instant, :o, :d, :timekey, :day_id
end
