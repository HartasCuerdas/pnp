class Od < ActiveRecord::Base
	before_create :defaulttimekey
	private
	  def defaulttimekey
      strtime = self.instant.strftime('%H%M')
      self.timekey = strtime
    end
end
