class Wanted < ApplicationRecord
  belongs_to :listing_area
  validates :description, :listing_area, presence: true
end
