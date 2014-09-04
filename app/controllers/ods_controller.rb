class OdsController < ApplicationController
  before_action :set_od, only: [:toggle_o, :toggle_d]

  # TOGGLE_O /ods/1
  def toggle_o
    @od.toggle_o
    render :nothing => true
  end

  # TOGGLE_D /ods/1
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
