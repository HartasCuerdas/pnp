# Days Controller
class DaysController < ApplicationController
  before_action :set_day, only: [:show, :toggle_wr]
  before_action :set_week, only: [:toggle_wr]

  # GET /days
  # GET /days.json
  def index
    @days = Day.where(week_id: params[:week_id])
  end

  # GET /days/1
  # GET /days/1.json
  def show
  end

  # PUT TOGGLE_WR /days/1
  def toggle_wr
    @day.toggle_wr
    respond_to do |format|
      format.json { render 'weeks/show', status: :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_day
      @day = Day.find(params[:id])
    end

    def set_week
      @week = Week.find(@day.week_id)
    end

end
