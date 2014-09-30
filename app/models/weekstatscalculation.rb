# WeekStatsCalculation Method Object
# created to refactor Week Stats Calculation
class WeekStatsCalculation

  # Initializes @week
  def initialize(week)
    @week = week
  end

  # Calculates Stats for Week
  # calls Week#setStatsToZero
  def calculateStats
    
    oTotal = 0
    dTotal = 0
    oMAX = 0
    dMAX = 0
    # MIN seed to 20, MIN used to be 2 or 3
    oMIN = 20
    dMIN = 20
    totalDays = 0

    @week.days.each do |day|
      if day.well_registered
        totalDays += 1
        oTotal += day.oTotal
        dTotal += day.dTotal
        oMAX = [day.oTotal, oMAX].max
        oMIN = [day.oTotal, oMIN].min
        dMAX = [day.oTotal, dMAX].max
        dMIN = [day.oTotal, dMIN].min
      end
    end

    if totalDays > 0
      @week.oAVG = oTotal/totalDays.to_f
      @week.dAVG = dTotal/totalDays.to_f
      @week.oMAX = oMAX
      @week.oMIN = oMIN
      @week.dMAX = dMAX
      @week.dMIN = dMIN
    else      
      @week.setStatsToZero
    end

  end

end
