$ ->
  $("[data-behavior='toggle-user-role']").on "change", (e) ->
    role = $(this).val()
    user_id = $(this).data("id")
    $.ajax
      url: "/users/#{user_id}/update_role"
      method: "POST"
      dataType: 'script'
      data: { role: role }
      success: (data) ->
        $.toasts('add', { msg: 'Successfully changed user role to: ' + role})

