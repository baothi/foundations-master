class ImageSet
  limit: 10


$ ->
#  $('ul.client-stages li').first().find('a').click()

  $('.custom-images').hover (->
    $(this).find('.caption').slideDown 100
    #.fadeIn(250)
    return
  ), ->
    $(this).find('.caption').slideUp 100
    #.fadeOut(205)
    return

  $(document).on "click", "#toggle-client-images", (e) ->
    e.preventDefault()
    widget = uploadcare.MultipleWidget("#client_image_group")
    dialog = widget.openDialog()

    widget.onChange (fileGroup) ->
      $("#client_images").val("")
      if fileGroup
        images = ""
        $.when.apply(null, fileGroup.files()).done ->
          $.each arguments, (i, fileInfo) ->
            src = fileInfo.cdnUrl
            images += fileInfo.cdnUrl
            if i < fileGroup.files().length - 1
              images += ","
          $("#client_images").val(images)
