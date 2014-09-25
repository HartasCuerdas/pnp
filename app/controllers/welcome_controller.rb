# Welcome Controller
class WelcomeController < ApplicationController
  #index
  def index
  	dateToday = Date.today
    @strToday = dateToday.strftime('%b %d, %a')
  end

  # OPTIONS
  # renders nothing
  def options
    render nothing: true
  end
  
end
