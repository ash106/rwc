class WaterRightSerializer < ActiveModel::Serializer
  attributes :id, :number, :flow_cfs, :flow_ac_ft, :sole_supply_acres, :place_of_use, :change_application_number, :proof_due_date
end
