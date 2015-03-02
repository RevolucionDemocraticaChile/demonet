# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

users_ready = ->
  $('#member_group_groups').select2
    placeholder: 'Selecciona Espacios'
    allowClear: true
  return

$(document).ready(users_ready)
$(document).on('page:load', users_ready)
