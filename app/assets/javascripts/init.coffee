class Init
  constructor: (el) ->
    @el = $(el)

  previewAttachments: ->
    numFiles = if @el.get(0).files then @el.get(0).files.length else 1
    label = @el.val().replace(/\\/g, '/').replace(/.*\//, '')
    console.log label
    @el.trigger 'fileselect', [
      numFiles
      label
    ]

$(document).on "change", ":file", (event) ->
  input = new Init @
  input.previewAttachments()

