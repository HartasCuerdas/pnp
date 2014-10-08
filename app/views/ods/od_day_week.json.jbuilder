json.od do
  json.extract! @od, :id, :instant, :o, :d, :timekey, :created_at, :updated_at
end
json.day do
  json.extract! @day, :id, :date, :oTotal, :dTotal, :wr, :week_id
end
json.week do
  json.extract! @week, :id, :firstDay, :oAVG, :dAVG, :oMAX, :oMIN, :dMAX, :dMIN, :comment
end