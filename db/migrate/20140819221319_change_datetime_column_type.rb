class ChangeDatetimeColumnType < ActiveRecord::Migration
  def change
  	change_table :days do |d|
  		d.change :date, :date
  	end
  end
end