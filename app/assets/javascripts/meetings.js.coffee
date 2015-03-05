# meetings_ready = ->
#   Editor = (input, preview) ->
#     @update = ->
#       preview.innerHTML = markdown.toHTML(input.value)
#       return
#
#     input.editor = this
#     @update()
#     return
#
#   new Editor(document.getElementById('minutes_textarea'), document.getElementById('minutes_preview'))
#   return
#
# $(document).ready(meetings_ready)
# $(document).on('page:load', meetings_ready)
