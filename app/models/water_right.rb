class WaterRight < ActiveRecord::Base
  has_many :place_of_use_area_water_rights
  has_many :place_of_use_areas, through: :place_of_use_area_water_rights
  has_many :point_of_diversion_water_rights
  has_many :point_of_diversions, through: :point_of_diversion_water_rights
end
