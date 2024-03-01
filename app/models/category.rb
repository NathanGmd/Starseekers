class Category < ApplicationRecord
  has_many :planets
  has_one_attached :image
end
