$('[data-behavior~=nested-action-delete]').bind 'ajax:success', ->
  $(this).closest('tr').fadeOut()