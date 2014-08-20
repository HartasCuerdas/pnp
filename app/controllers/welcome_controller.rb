class WelcomeController < ApplicationController
  def index
  	now = Time.now
			@strToday = now.strftime('%b %d')
  end
end
