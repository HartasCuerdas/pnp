# WeekStatsUpdate Method Object
# created to refactor Week Stats Update
class WeekStatsUpdate

  # Initializes @week
  # @param [Week] week uses and initializes this method object
  def initialize(week)
    
    @week = week
    
    @oTotal = 0
    @dTotal = 0
    @oMAX = 0
    @dMAX = 0
    # MIN seed to 20, MIN used to be 2 or 3
    @oMIN = 20
    @dMIN = 20
    
  end

  # Update Stats for Week
  # calls WeekStatsUpdate#assignStats
  def updateStats
    
    totalDays = 0

    @week.days.each do |day|
      if day.well_registered
        totalDays += 1
        @oTotal += day.oTotal
        @dTotal += day.dTotal
        @oMAX = [day.oTotal, @oMAX].max
        @oMIN = [day.oTotal, @oMIN].min
        @dMAX = [day.oTotal, @dMAX].max
        @dMIN = [day.oTotal, @dMIN].min
      end
    end

    assignStats(totalDays)

  end

  # Assigns calculates Stats to Week
  # calls Week#setStatsToZero
  def assignStats(totalDays)
    if totalDays > 0
      @week.oAVG = @oTotal/totalDays.to_f
      @week.dAVG = @dTotal/totalDays.to_f
      @week.oMAX = @oMAX
      @week.oMIN = @oMIN
      @week.dMAX = @dMAX
      @week.dMIN = @dMIN
    else      
      @week.setStatsToZero
    end
    @week.save
  end

end
