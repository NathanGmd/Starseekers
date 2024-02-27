class Planet < ApplicationRecord
  belongs_to :category
  belongs_to :solar_system
  belongs_to :user
  has_many :bookings
end
