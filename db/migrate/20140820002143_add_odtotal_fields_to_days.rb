class AddOdtotalFieldsToDays < ActiveRecord::Migration
  def change
    add_column :days, :oTotal, :integer
    add_column :days, :dTotal, :integer
  end
end
