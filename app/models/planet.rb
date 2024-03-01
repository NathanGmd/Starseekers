class Planet < ApplicationRecord
  belongs_to :category
  belongs_to :solar_system
  belongs_to :user
  has_many :bookings, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :global_search,
  against: [ :name, :content, ],
  associated_against: {
    solar_system: [ :name ]
  },
  using: {
    tsearch: { prefix: true }
  }

end
