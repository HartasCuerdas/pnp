# Week model
class Week < ActiveRecord::Base
  has_many :days, dependent: :destroy
  # Stablishes default values for new Weeks
  before_create :default_values

  # Style class for current week
  IS_CURRENT_WEEK_STYLE = 'is-current-week'

  # firstDay date to string
  def str_FirstDay
    firstDay.strftime('%b %e')
  end

  # Calculates stats
  def calculateStats
    oTotal = 0
    dTotal = 0
    oMAX = 0
    dMAX = 0
    # MIN seed to 20, MIN used to be 2 or 3
    oMIN = 20
    dMIN = 20
    totalDays = 0
    days.each do |day|
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
  end

  # Updates Stats
  # Calls Weeks#calculateStats
  def updateStats
    calculateStats
    self.save
  end

  # returns IS_CURRENT_WEEK_STYLE for current week  
  # used in Weeks index
  def str_isCurrentWeekClass
    currentWeekFirstDay = Date.today.beginning_of_week(:sunday)
    (firstDay == currentWeekFirstDay) ? IS_CURRENT_WEEK_STYLE : ''
  end

  private

    def default_values
      weeks = Week.all
      if ! weeks.empty?
        lastWeek = weeks.last
        date_newWeekFirstDay = lastWeek.firstDay + 1.week
      else
        currentWeekFirstDay = Date.today.beginning_of_week(:sunday)
        date_newWeekFirstDay = currentWeekFirstDay
      end
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
        create_day(firstDay + i.days)
      end
    end

    def create_day(date)
      days.new(:date => date, :oTotal => 0, :dTotal => 0, :well_registered => false)
    end

end
