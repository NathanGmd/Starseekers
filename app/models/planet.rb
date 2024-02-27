class Planet < ApplicationRecord
  belongs_to :category_id
  belongs_to :solar_system_id
  belongs_to :user
  has_many :bookings
end
