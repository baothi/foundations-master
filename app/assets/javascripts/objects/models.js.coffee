class Model
  spinColor: "#009688"
  constructor: (@object, @objectId) ->

  triggerFileSelect: () ->
    $("input[data-behavior='hidden-file-input'][data-object='#{@object}'][data-id='#{@objectId}']").trigger('click')

  showSpinner: () ->
    $(".spinner-container[data-object='#{@object}'][data-id='#{@objectId}']").spin({color: @spinColor})

  previewElement: () ->
    preview = $("img[data-object='#{@object}'][data-id='#{@objectId}']")

  setDestroyValue: (value) ->
    $("input[data-action='destroy'][data-object='#{@object}'][data-id='#{@objectId}']").val(value)

$ ->

  # Trigger file select from add image icon
  $('[data-behavior~=select-object-image]').click (event) ->
    event.preventDefault()
    $image = $(this).closest("td").prev('td').find("img")
    widget = uploadcare.Widget("##{$(this).closest("td").find("input").attr("id")}")
    dialog = widget.openDialog()

    widget.onUploadComplete (info) ->
      $image.attr("src", info.cdnUrl)

  # Custom event handlers - https://github.com/fronteed/icheck
  $('[data-behavior~=toggle-object-destroy]').on "ifUnchecked", ->
    object    = $(this).data('object')
    objectId  = $(this).data('id')
    model = new Model(object, objectId)
    model.setDestroyValue(1)

  $('[data-behavior~=toggle-object-destroy]').on "ifChecked", ->
    object    = $(this).data('object')
    objectId  = $(this).data('id')
    model = new Model(object, objectId)
    model.setDestroyValue(0)



