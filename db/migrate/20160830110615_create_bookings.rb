class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.string :seat
      t.references :speech, foreign_key: true

      t.timestamps
    end
  end
end
