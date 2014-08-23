class AddWellRegisteredToDays < ActiveRecord::Migration
  def change
    add_column :days, :well_registered, :boolean
  end
end
