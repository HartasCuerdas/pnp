class AddOdStatsToWeeks < ActiveRecord::Migration
  def change
    add_column :weeks, :oAVG, :integer
    add_column :weeks, :dAVG, :integer
    add_column :weeks, :oMAX, :integer
    add_column :weeks, :dMAX, :integer
    add_column :weeks, :oMIN, :integer
    add_column :weeks, :dMIN, :integer
  end
end
