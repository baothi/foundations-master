$('.error-messages').empty()
<% if @client_image.errors.blank? %>
$('#client_images-modal').modal('hide')
$('#images-panel').ScrollTo();
<% else %>
$('.error-messages').append("<%= j render "shared/modal_error_messages", object: @client_images %>")
<% end %>
