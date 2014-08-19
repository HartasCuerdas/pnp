class CreateOds < ActiveRecord::Migration
  def change
    create_table :ods do |t|
      t.datetime :instant
      t.boolean :o
      t.boolean :d
      t.string :timekey

      t.timestamps
    end
  end
end
