module ApplicationHelper
  def province_options
    ["Albera", "British Columbia", "Manitoba", "New Brunswick", "Newfoundland and Labrador", "Nova Scotia", "Ontario", "Prince Edward Island", "Quebec", "Saskatchewan", "Northwest Territories", "Nunavut", "Yukon"]
    #     /   option value="AB"  Alberta
    # /   option value="BC"  British Columbia
    # /   option value="MB"  Manitoba
    # /   option value="NB"  New Brunswick
    # /   option value="NL"  Newfoundland and Labrador
    # /   option value="NS"  Nova Scotia
    # /   option value="ON"  Ontario
    # /   option value="PE"  Prince Edward Island
    # /   option value="QC"  Quebec
    # /   option value="SK"  Saskatchewan
    # /   option value="NT"  Northwest Territories
    # /   option value="NU"  Nunavut
    # /   option value="YT"  Yukon
  end

  def link_with_icon(icon, text, path, options = {})
    link_to "#{material_icon(icon)} #{text}".html_safe, path, options
  end
end
