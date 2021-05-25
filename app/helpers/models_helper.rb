module ModelsHelper
  def model_object_destroy_value(plural, single)
    if plural.count > 0 && plural.include?(single)
      0
    elsif plural.count == 0
      0
    else
      1
    end
  end

  def model_object_checked_value(plural, single)
    if plural.count > 0 && plural.include?(single)
      true
    elsif plural.count == 0
      true
    else
      false
    end
  end
end
