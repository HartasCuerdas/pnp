require 'weekstatsupdate'

# Week model
class Week < ActiveRecord::Base
  has_many :days, dependent: :destroy
  # Stablishes default values for new Weeks
  before_create :default_values

  # Updates Stats
  # Calls Weeks#calculateStats
  def updateStats
    weekStatsUpdate = WeekStatsUpdate.new(self)
    weekStatsUpdate.updateStats
  end

  def pubSetStatsToZero
    setStatsToZero
  end

  private

    # Sets default values for Week creation
    # calls Week#setStatsToZero
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
      setStatsToZero
      createDays
    end

    # Set all Stats values to Zero
    # called by WeekStatsCalculation#calculateStats
    def setStatsToZero
      self.oAVG = 0
      self.dAVG = 0
      self.oMAX = 0
      self.dMAX = 0
      self.oMIN = 0
      self.dMIN = 0
    end

    # Create 7 days of the week for current Week
    # calls Week#createDay
    def createDays
      for i in 0..6
        createDay(firstDay + i.days)
      end
    end

    # Create a Day
    # called by Week#createDays
    def createDay(date)
      days.new(:date => date, :oTotal => 0, :dTotal => 0, :wr => false)
    end

end
