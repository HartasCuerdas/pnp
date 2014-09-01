class Week < ActiveRecord::Base
  has_many :days, dependent: :destroy
  before_create :create_days

  def str_FirstDay
    self.firstDay.strftime('%b %e')
  end

  def calculateStats
    oTotal = 0
    dTotal = 0
    oMAX = 0
    dMAX = 0
    # MIN seed to 20, MIN used to be 2 or 3
    oMIN = 20
    dMIN = 20
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
        if day.oTotal > oMAX
          oMAX = day.oTotal
        end
        if day.oTotal < oMIN
          oMIN = day.oTotal
        end
        if day.dTotal > dMAX
          dMAX = day.dTotal
        end
        if day.dTotal < dMIN
          dMIN = day.dTotal
        end
      end
    end
    if totalDays > 0
      self.oAVG = oTotal/totalDays.to_f
      self.dAVG = dTotal/totalDays.to_f
      #logger.debug "totalDays: #{totalDays}"
      #logger.debug "self.oAVG: #{self.oAVG}"
      #logger.debug "self.dAVG: #{self.dAVG}"
      self.oMAX = oMAX
      self.oMIN = oMIN
      self.dMAX = dMAX
      self.dMIN = dMIN
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
