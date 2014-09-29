# Day model
class Day < ActiveRecord::Base
  #attr_accessible :date
  has_many :ods, dependent: :destroy
  belongs_to :week
  before_create :create_ods

  scope :order_by_date, -> { order('date ASC') }
  scope :belongs_to_week, -> (week_id) { where(week_id: week_id) }

  # Text value for boolean
  WR_TEXT_TRUE = 'Well'
  # Text value for boolean
  WR_TEXT_FALSE = 'Poor'
  
  # Twitter Bootstrap Button Style Class
  WR_STYLE_TRUE = 'btn-success'
  # Twitter Bootstrap Button Style Class
  WR_STYLE_FALSE = 'btn-danger'

  # Style class
  IS_TODAY_STYLE = 'is-today'

  # returns format date string for date
  def str_date
    date.strftime('%b %e, %a')
  end

  # returns string for well_registered boolean
  def str_wr
    well_registered ? WR_TEXT_TRUE : WR_TEXT_FALSE
  end

  # returns Style class for well_registered boolean
  def str_wr_TwbsBtnStyleClass
    well_registered ? WR_STYLE_TRUE : WR_STYLE_FALSE
  end

  # returns Style for current day
  # used in Week show (table of days)
  def str_isTodayClass
    (date == Date.today) ? IS_TODAY_STYLE : ''
  end

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
    self.save

    # calls Week#calculateStats
    week.calculateStats
    week.save

  end

  # toggles well_registered boolean value
  def toggle_wr
    toggle!(:well_registered)
    self.save
    week.calculateStats
    week.save
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