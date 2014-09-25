# Days Controller
class DaysController < ApplicationController
  before_action :set_day, only: [:show, :toggle_wr]

  # OPTIONS /days
  # renders nothing
  def options
    render nothing: true
  end

  # GET /days
  # GET /days.json
  def index
    @days = Day.belongs_to_week(params[:week_id]).order_by_date
  end

  # GET /days/1
  # GET /days/1.json
  def show
  end

  # PATCH /days/1/toggle_wr
  def toggle_wr
    @day.toggle_wr
    @week = @day.week
    respond_to do |format|
      format.json { render 'weeks/show', status: :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_day
      @day = Day.find(params[:id])
    end

end
