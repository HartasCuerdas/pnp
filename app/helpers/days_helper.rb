module DaysHelper
	def strDayDate(day)
		day.date.strftime('%b %e, %a')
	end
	def enable_day_link_text(well_registered)
		well_registered ? 'Well' : 'Poor'
	end
end