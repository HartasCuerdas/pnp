class ChangeOdAvgStatsInWeeks < ActiveRecord::Migration
  def change
    change_column :weeks, :oAVG, :float
    change_column :weeks, :dAVG, :float
  end
end
