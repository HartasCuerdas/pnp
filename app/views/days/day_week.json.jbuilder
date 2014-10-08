json.day do
  json.extract! @day, :id, :date, :oTotal, :dTotal, :wr, :week_id
end
json.week do
  json.extract! @week, :id, :firstDay, :oAVG, :dAVG, :oMAX, :oMIN, :dMAX, :dMIN, :comment
end