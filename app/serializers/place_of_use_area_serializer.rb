class PlaceOfUseAreaSerializer < ActiveModel::Serializer
  attributes :type, :properties, :geometry

  def type
    "Feature"
  end

  def properties
    { id: object.id, name: object.name, color: object.color, water_rights: object.water_rights }
  end

  def geometry
    object.polygon
  end
end
