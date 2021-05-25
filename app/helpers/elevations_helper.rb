module ElevationsHelper
  def is_elevation_checked(elevation)
    checked = @model.elevations.count > 0 && !@model.elevations.include?(elevation) ? false : true
  end
end
