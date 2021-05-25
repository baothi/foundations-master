class Clients
  constructor: () ->
    @autoSaveForm = $('[data-behavior~=autosave-form]')

  autoSaveClient: () ->
    $.ajax
      url: '/clients/' + @autoSaveForm.data('id') + '/update_remote.json'
      method: "PUT"
      dataType: 'json'
      data: @autoSaveForm.serialize()
      complete: (data) ->
        #$.toasts('add', { msg: 'Successfully updated current stage'})

$ ->
  clients = new Clients()

  clients.autoSaveForm.find('input').blur ->
    clients.autoSaveClient()
  clients.autoSaveForm.find('select').change ->
    clients.autoSaveClient()

  $(document).on 'change', '#client_model_id', (evt) ->
    $.ajax '/update_stage_select',
      type: 'GET'
      dataType: 'script'
      data: {
        model_id: $("#client_model_id option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")

  $(".date-picker").datepicker()

  $("[data-behavior='toggle-client-stage']").on "change", (e) ->
    stage_id = $(this).val()
    client_id = $(this).data("id")
    $.ajax
      url: "/clients/#{client_id}.json"
      method: "PUT"
      dataType: 'script'
      data: { client: { stage_id: stage_id } }
      complete: (data) ->
        $.toasts('add', { msg: 'Successfully updated current stage'})


