class Od < ActiveRecord::Base
	belongs_to :day
	#attr_accessible :timekey, :day_id
	#before_create :defaulttimekey
	private
	  def defaulttimekey
	  	strmin = self.instant.strftime('%M')
	  	if (strmin.to_i >= 30)
	  		strmin = '30'
	  	else
	  		strmin = '00'
	  	end
      strtime = self.instant.strftime('%H:') + strmin
      self.timekey = strtime
  end
end
