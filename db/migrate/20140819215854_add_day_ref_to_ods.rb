class AddDayRefToOds < ActiveRecord::Migration
  def change
    add_reference :ods, :day, index: true
  end
end
