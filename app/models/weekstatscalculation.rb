class WeekStatsCalculation

  def initialize(weekparam)
    @week = weekparam
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

    @week.days.each do |day|
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
      @week.oAVG = oTotal/totalDays.to_f
      @week.dAVG = dTotal/totalDays.to_f
      @week.oMAX = oMAX
      @week.oMIN = oMIN
      @week.dMAX = dMAX
      @week.dMIN = dMIN
    else
      @week.oAVG = 0
      @week.dAVG = 0
      @week.oMAX = 0
      @week.dMAX = 0
      @week.oMIN = 0
      @week.dMIN = 0
    end

  end

end
