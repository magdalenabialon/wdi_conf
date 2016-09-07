class Attendance < ApplicationRecord
  belongs_to :afterevent
  belongs_to :user
end
