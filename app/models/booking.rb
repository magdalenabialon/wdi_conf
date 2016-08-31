class Booking < ApplicationRecord
  belongs_to :speech
  belongs_to :user
end
