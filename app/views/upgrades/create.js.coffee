$('.error-messages').empty()
<% if @upgrade.errors.blank? %>
$('.modal').modal('hide')
$('table#upgrade-list tbody').append("<%= j render "upgrades/shared/row", object: @upgrade %>")
<% else %>
$('.error-messages').append("<%= j render "shared/modal_error_messages", object: @upgrade %>")
<% end %>