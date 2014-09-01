class Week < ActiveRecord::Base
  has_many :days, dependent: :destroy
  before_create :create_days

  def str_FirstDay
    self.firstDay.strftime('%b %e')
  end

  def calculateStats
    oTotal = 0
    dTotal = 0
    totalDays = 0
    self.days.each do |day|
      if day.well_registered
        totalDays += 1
        oTotal += day.oTotal
        #logger.debug "date: #{day.str_date} => oTotal: #{day.oTotal}"
        #logger.debug "oTotal: #{oTotal}"
        dTotal += day.dTotal
        #logger.debug "date: #{day.str_date} => dTotal: #{day.dTotal}"
        #logger.debug "dTotal: #{dTotal}"
      end
    end
    if totalDays > 0
      self.oAVG = oTotal/totalDays.to_f
      self.dAVG = dTotal/totalDays.to_f
      #logger.debug "totalDays: #{totalDays}"
      #logger.debug "self.oAVG: #{self.oAVG}"
      #logger.debug "self.dAVG: #{self.dAVG}"
    else
      self.oAVG = 0
      self.dAVG = 0
    end
  end

  private

    def create_days
      self.days.new(:date => self.firstDay)
      self.days.new(:date => self.firstDay + 1.days)
      self.days.new(:date => self.firstDay + 2.days)
      self.days.new(:date => self.firstDay + 3.days)
      self.days.new(:date => self.firstDay + 4.days)
      self.days.new(:date => self.firstDay + 5.days)
      self.days.new(:date => self.firstDay + 6.days)
    end

end
