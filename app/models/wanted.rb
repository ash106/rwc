class Wanted < ActiveRecord::Base
  belongs_to :listing_area
  validates :description, presence: true
end
