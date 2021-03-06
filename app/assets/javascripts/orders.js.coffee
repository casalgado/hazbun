# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
	$('form').on 'click', '.add_fields', (event) ->
		time = new Date().getTime()
		regexp = new RegExp($(this).data('id'), 'g')
		$(this).before($(this).data('fields').replace(regexp, time))
		event.preventDefault()


	$('form').on 'click', '.remove_link', (event) ->
		$(this).prev('input[type=hidden]').val('1')
		$(this).closest('fieldset').hide()
		event.preventDefault()


set = ->
	$('#payment_date').datetimepicker
		dateFormat: 'dd-mm-yy'



$(document).ready(ready)
$(document).on('page:load', ready)

$(document).ready(set)
$(document).on('page:load', set)






