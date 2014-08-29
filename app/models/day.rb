class Day < ActiveRecord::Base
	#attr_accessible :date
	has_many :ods, dependent: :destroy
	belongs_to :days
	before_create :create_ods

	WELL_REGISTERED_TEXT_TRUE = 'Well'
	WELL_REGISTERED_TEXT_FALSE = 'Poor'
	
	# Twitter Bootstrap Button Style Class
	WELL_REGISTERED_STYLE_TRUE = 'btn-success'
	WELL_REGISTERED_STYLE_FALSE = 'btn-danger'

	IS_TODAY_STYLE = 'is-today'

	def str_date
		self.date.strftime('%b %e, %a')
	end

	def str_wellRegistered
		self.well_registered ? WELL_REGISTERED_TEXT_TRUE : WELL_REGISTERED_TEXT_FALSE
	end

	def str_wellRegistered_TwbsBtnStyleClass
		self.well_registered ? WELL_REGISTERED_STYLE_TRUE : WELL_REGISTERED_STYLE_FALSE
	end

	def str_isTodayClass
		(self.date == Date.today) ? IS_TODAY_STYLE : ''
	end

	private

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
      			self.ods.new(:timekey => hour)
    		end

		end

end