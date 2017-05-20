class WaterRightSerializer < ActiveModel::Serializer
  attributes :number, :flow_cfs, :flow_ac_ft, :sole_supply_acres, :uses, :change_application_number, :proof_due_date, :priority_date, :comments
end
