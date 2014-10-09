# Week Controller
class WeeksController < ApplicationController
  before_action :set_week, only: [:show, :update, :destroy]

  # GET /weeks
  # GET /weeks.json
  def index
    @weeks = Week.all

    dateToday = Date.today
    @strToday = dateToday.strftime('%b %d, %a')
    
    lastWeek = @weeks.last
    date_newWeekFirstDay = lastWeek.firstDay + 1.week
    @str_newWeekFirstDay = date_newWeekFirstDay.strftime('%b %e')
  end

  # GET /weeks/1
  # GET /weeks/1.json
  def show
  end

  # POST /weeks
  # POST /weeks.json
  def create
    @week = Week.new

    respond_to do |format|
      if @week.save
        format.json { render :show, status: :created, location: @week }
      end
    end
  end

  # PATCH/PUT /weeks/1
  # PATCH/PUT /weeks/1.json
  def update
    respond_to do |format|
      if @week.update(week_params)
        format.json { render :show, status: :ok, location: @week }
      else
        format.json { render json: @week.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weeks/1
  # DELETE /weeks/1.json
  def destroy
    @week.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_week
      @week = Week.find(params[:id])
    end

end
