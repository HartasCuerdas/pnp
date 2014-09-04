class DaysController < ApplicationController
  before_action :set_day, only: [:show, :toggle_wr]

  # GET /days
  # GET /days.json
  def index
    @days = Day.where(week_id: params[:week_id])
  end

  # GET /days/1
  # GET /days/1.json
  def show
  end

  # TOGGLE_WR /days/1
  def toggle_wr
    @day.toggle_wr
    respond_to do |format|
      format.js {}
    end
    #respond_to do |format|
    #  format.json { render 'days/show', status: :ok }
    #end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_day
      @day = Day.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def day_params
      params.require(:day).permit(:date)
    end

end
