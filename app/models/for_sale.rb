class ForSale < ActiveRecord::Base
  belongs_to :listing_area
  validates :description, :price, :listing_area, presence: true
end
