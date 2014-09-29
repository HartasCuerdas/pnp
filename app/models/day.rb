# Day model
class Day < ActiveRecord::Base
  #attr_accessible :date
  has_many :ods, dependent: :destroy
  belongs_to :week
  before_create :create_ods

  scope :order_by_date, -> { order('date ASC') }
  scope :belongs_to_week, -> (week_id) { where(week_id: week_id) }

  # calculates oTotal and dTotal  
  # calls Week#calculateStats
  def calculateTotals
    
    oTotal = 0
    dTotal = 0
    ods.each do |od|
      if od.o
        oTotal+=1
      end
      if od.d
        dTotal+=1
      end
    end
    
    self.oTotal = oTotal
    self.dTotal = dTotal

  end

  # Updates Totals
  # Called by Od#toggle_o and Od#toggle_d
  # Conditionally calls Week#updateStats
  def updateTotals
    calculateTotals
    save
    if well_registered
      week.updateStats 
    end
  end

  # toggles well_registered boolean value
  def toggle_wr
    toggle!(:well_registered)
    week.updateStats
  end

  private

    # created Ods for each hour
    def create_ods

      hoursarr = [
        '06:00', '06:30',
        '07:00', '07:30',
        '08:00', '08:30',
        '09:00', '09:30',
        '10:00', '10:30',
        '11:00', '11:30',
        '12:00', '12:30',
        '13:00', '13:30',
        '14:00', '14:30',
        '15:00', '15:30',
        '16:00', '16:30',
        '17:00', '17:30',
        '18:00', '18:30',
        '19:00', '19:30',
        '20:00', '20:30',
        '21:00', '21:30',
        '22:00', '22:30',
        '23:00', '23:30',
        ]

      hoursarr.each do |hour|
        ods.new(:timekey => hour, :o => false, :d => false)
      end

    end

end