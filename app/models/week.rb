class Week < ActiveRecord::Base
	has_many :days, dependent: :destroy
	before_create :create_days

	private

		def create_days
			self.days.new(:date => self.firstDay)
			self.days.new(:date => self.firstDay + 1.days)
			self.days.new(:date => self.firstDay + 2.days)
			self.days.new(:date => self.firstDay + 3.days)
			self.days.new(:date => self.firstDay + 4.days)
			self.days.new(:date => self.firstDay + 5.days)
			self.days.new(:date => self.firstDay + 6.days)
		end

end
