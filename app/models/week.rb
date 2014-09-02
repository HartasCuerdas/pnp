class Week < ActiveRecord::Base
  has_many :days, dependent: :destroy
  before_create :default_values

  IS_CURRENT_WEEK_STYLE = 'is-current-week'

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
        dTotal += day.dTotal
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
      self.oMAX = oMAX
      self.oMIN = oMIN
      self.dMAX = dMAX
      self.dMIN = dMIN
    else
      self.oAVG = 0
      self.dAVG = 0
      self.oMAX = 0
      self.dMAX = 0
      self.oMIN = 0
      self.dMIN = 0
    end
    self.save
  end

  def str_isCurrentWeekClass
    currentWeekFirstDay = Date.today.beginning_of_week(:sunday)
    (self.firstDay == currentWeekFirstDay) ? IS_CURRENT_WEEK_STYLE : 'as'
  end

  private

    def default_values
      weeks = Week.all
      lastWeek = weeks.last
      date_newWeekFirstDay = lastWeek.firstDay + 1.week
      self.firstDay = date_newWeekFirstDay
      self.comment = ''
      self.oAVG = 0
      self.dAVG = 0
      self.oMAX = 0
      self.dMAX = 0
      self.oMIN = 0
      self.dMIN = 0
      create_days
    end

    def create_days
      for i in 0..6
        create_day(self.firstDay + i.days)
      end
    end

    def create_day(date)
      self.days.new(:date => date, :oTotal => 0, :dTotal => 0, :well_registered => false)
    end

end
