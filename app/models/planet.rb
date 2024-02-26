class Planet < ApplicationRecord
  belongs_to :user_id
  belongs_to :category_id
  belongs_to :solar_system_id
end
