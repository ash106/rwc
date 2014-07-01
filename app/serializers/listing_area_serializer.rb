class ListingAreaSerializer < ActiveModel::Serializer
  attributes :type, :properties, :geometry
  
  def type
    "Feature"
  end

  def properties
    { id: object.id, name: object.name, policy: object.policy, wanteds: object.wanteds, for_sales: object.for_sales }
  end

  def geometry
    object.polygon
  end
end
