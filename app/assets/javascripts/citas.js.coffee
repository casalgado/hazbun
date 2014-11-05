# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



set = ->
	$('#cita_fecha').datetimepicker
		dateFormat: 'dd-mm-yy'

$(document).ready(set)
$(document).on('page:load', set)

