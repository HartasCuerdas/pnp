# Ods Controller
class OdsController < ApplicationController
  before_action :set_od, only: [:toggle_o, :toggle_d]

  # GET /ods
  # GET /ods.json
  def index
    @ods = Od.where(day_id: params[:day_id])
  end

  # PUT TOGGLE_O /ods/1
  def toggle_o
    @od.toggle_o
    render :nothing => true
  end

  # PUT TOGGLE_D /ods/1
  def toggle_d
    @od.toggle_d
    render :nothing => true
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_od
      @od = Od.find(params[:id])
      @day = Day.find(@od.day_id)
    end

end
