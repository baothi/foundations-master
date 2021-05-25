module FloorPlansHelper
  def is_floor_plan_checked(floor_plan)
    checked = @model.floor_plans.count > 0 && !@model.floor_plans.include?(floor_plan) ? false : true
  end
end
