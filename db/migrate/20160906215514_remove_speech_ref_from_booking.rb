class RemoveSpeechRefFromBooking < ActiveRecord::Migration[5.0]
  def change
    remove_reference :bookings, :speech, foreign_key: true
  end
end
