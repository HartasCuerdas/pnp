class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :days, :well_registered, :wr
  end
end
