$(document).on 'ready page:load', ->
  $('form').on 'click', '.add_field', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  $('form').on 'click', '.remove_field', (event) ->
    $(this).prev('input[name*=_destroy]').val('true')
    $(this).closest('div').hide()
    event.preventDefault()
