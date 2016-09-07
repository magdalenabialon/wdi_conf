class CreateSeats < ActiveRecord::Migration[5.0]
  def change
    create_table :seats do |t|
      t.text :seatNumber
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
