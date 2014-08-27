class WelcomeController < ApplicationController
  def index
  	dateToday = Date.today
	@strToday = dateToday.strftime('%b %d, %a')
  end
end
