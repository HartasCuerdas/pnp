class CreateMonths < ActiveRecord::Migration
  def change
    create_table :months do |t|
      t.date :firstDay
      t.text :comment

      t.timestamps
    end
  end
end
