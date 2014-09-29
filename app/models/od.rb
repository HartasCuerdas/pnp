# Od model
class Od < ActiveRecord::Base
  belongs_to :day

  scope :belongs_to_day, -> (day_id) { where(day_id: day_id) }

  # Toogles o  
  # Calls Day#updateTotals
  def toggle_o
    toggle!(:o)
    day.updateTotals
  end

  # Toogles d  
  # Calls Day#updateTotals
  def toggle_d
    toggle!(:d)
    day.updateTotals
  end

end