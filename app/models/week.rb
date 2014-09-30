# Week model
require 'weekstatscalculation'

class Week < ActiveRecord::Base
  has_many :days, dependent: :destroy
  # Stablishes default values for new Weeks
  before_create :default_values

  # Updates Stats
  # Calls Weeks#calculateStats
  def updateStats
    weekStatsCalculation = WeekStatsCalculation.new(self)
    weekStatsCalculation.calculateStats
    self.save
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
