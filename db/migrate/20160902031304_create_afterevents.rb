class CreateAfterevents < ActiveRecord::Migration[5.0]
  def change
    create_table :afterevents do |t|
      t.string :name
      t.string :location
      t.string :lat
      t.string :long
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
