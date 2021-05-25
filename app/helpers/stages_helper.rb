module StagesHelper

  def is_stage_checked(stage)
    checked = @model.stages.count > 0 && !@model.stages.include?(stage) ? false : true
  end
end
