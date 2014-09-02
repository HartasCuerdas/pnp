class Od < ActiveRecord::Base
  belongs_to :day

  OD_TEXT_TRUE = 'ON'
  OD_TEXT_FALSE = 'OFF'
  
  # Twitter Bootstrap Button Style Class
  OD_STYLE_TRUE = 'btn-success'
  OD_STYLE_FALSE = 'btn-default'

  def str_o_enabled
    str_od_enabled(self.o)
  end

  def str_d_enabled
    str_od_enabled(self.d)
  end

  def str_od_enabled(od)
    od ? OD_TEXT_TRUE : OD_TEXT_FALSE
  end

  def str_o_TwbsBtnStyleClass
    str_od_TwbsBtnStyleClass(self.o)
  end

  def str_d_TwbsBtnStyleClass
    str_od_TwbsBtnStyleClass(self.d)
  end

  def str_od_TwbsBtnStyleClass(od)
    od ? OD_STYLE_TRUE : OD_STYLE_FALSE
  end

  def toggle_o
    toggle!(:o)
    self.save
    day.calculateTotals
  end

  def toggle_d
    toggle!(:d)
    self.save
    day.calculateTotals
  end

end