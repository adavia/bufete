class Init
  constructor: (el) ->
    @el = $(el)

  previewAttachments: ->
    $(".file-text").text("Se adjuntó #{@el.get(0).files.length} archivos")

$(document).on "change", ":file", (event) ->
  input = new Init @
  input.previewAttachments()

