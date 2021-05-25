$('.error-messages').empty()
<% if @selection.errors.blank? %>
$('#selection-modal').modal('hide')
$('#selections-panel').ScrollTo();
<% else %>
$('.error-messages').append("<%= j render "shared/modal_error_messages", object: @selection %>")
<% end %>