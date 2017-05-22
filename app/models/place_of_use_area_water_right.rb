class PlaceOfUseAreaWaterRight < ActiveRecord::Base
  belongs_to :place_of_use_area
  belongs_to :water_right
  validates :place_of_use_area, :water_right, presence: true
end
