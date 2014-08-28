class AddWeekRefToDays < ActiveRecord::Migration
  def change
    add_reference :days, :week, index: true
  end
end
