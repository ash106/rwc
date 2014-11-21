class ForSale < ActiveRecord::Base
  belongs_to :listing_area
  validates :description, presence: true
  validates :price, presence: true
end
