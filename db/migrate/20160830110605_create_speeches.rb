class CreateSpeeches < ActiveRecord::Migration[5.0]
  def change
    create_table :speeches do |t|
      t.string :name
      t.datetime :starttime
      t.datetime :endtime
      t.string :speaker
      t.string :theme

      t.timestamps
    end
  end
end
