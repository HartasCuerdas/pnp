# Ods Controller
class OdsController < ApplicationController
  before_action :set_od, only: [:toggle_o, :toggle_d]

  # GET /ods
  # GET /ods.json
  def index
    @ods = Od.belongs_to_day(params[:day_id])
  end

  # PATCH /ods/1/toggle_o
  def toggle_o
    @od.toggle_o
    toggle_od_response
  end

  # PATCH /ods/1/toggle_d
  def toggle_d
    @od.toggle_d
    toggle_od_response
  end

  def toggle_od_response
    @day = @od.day
    respond_to do |format|
      format.json { render 'days/show', status: :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_od
      @od = Od.find(params[:id])
    end

end
