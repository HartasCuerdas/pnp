class Day < ActiveRecord::Base
	#attr_accessible :date
	has_many :ods
	belongs_to :days

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

end