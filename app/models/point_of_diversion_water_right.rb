class PointOfDiversionWaterRight < ApplicationRecord
  belongs_to :point_of_diversion
  belongs_to :water_right
  validates :point_of_diversion, :water_right, presence: true
end
