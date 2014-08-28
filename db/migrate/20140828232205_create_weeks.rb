class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.date :firstDay
      t.text :comment

      t.timestamps
    end
  end
end
