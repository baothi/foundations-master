# Update the select field
$(".stage-select-container").empty()
  .append("<%= escape_javascript(render 'clients/stage_select', object: @model) %>")

# re-run theme methods
Foundations.App.init();