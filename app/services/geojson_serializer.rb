class GeojsonSerializer
  def self.to_geojson(geometry)
    result = {}
    features = []
    geometry.each do |item|
      features << {
        type: "Feature",
        geometry: item.respond_to?('polygon') ? item.polygon : item.point,
        # Need to add color to properties only for PlaceOfUseArea
        properties: { 
          id: item.id,
          name: item.name,
          water_rights: water_rights_for_item(item.water_rights)
        }
      }
    end
    result["type"] = "FeatureCollection"
    result["features"] = features
    ActiveSupport::JSON.encode(result)
  end

private

  def self.water_rights_for_item(water_rights)
    result = []
    water_rights.each do |water_right|
      result << {
        number: water_right.number,
        flow_cfs: water_right.flow_cfs,
        flow_ac_ft: water_right.flow_ac_ft,
        uses: water_right.uses,
        change_application_number: water_right.change_application_number,
        proof_due_date: water_right.proof_due_date,
        priority_date: water_right.priority_date,
        comments: water_right.comments,
        external_link: water_right.external_link,
        view_link_text: water_right.view_link_text
      }
    end
    result
  end
end
