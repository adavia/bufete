# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class Client
  constructor: (el) ->
    @el = $(el)

  search: ->
    @el.autocomplete
      source: "/clients"
      minLength: 2
      messages:
        noResults: ''
        results: ->
      create: (event, ui) =>
        @el.data('ui-autocomplete')._renderItem = (ul, item) =>
          $( "<li>" )
            .text(item.name)
            .appendTo(ul)
      select: (event, ui) =>
        Turbolinks.visit(ui.item.path)

$(document).on "turbolinks:load", ->
  client = new Client $("#client-search")
  client.search()
