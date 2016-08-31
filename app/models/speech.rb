class Speech < ApplicationRecord
  has_many :bookings, dependent: :destroy
end
