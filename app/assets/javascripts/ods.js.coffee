# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
	well_registered_buttons = $ '.btn-od-enable-day'
	well_registered_buttons.on "ajax:success", (e, data, status, xhr) ->
		$(this)
			.toggleClass 'btn-success'
			.toggleClass 'btn-default'
			.closest('tr').effect("highlight", {}, 1500)
		if $(this).text() == 'ON'
			$(this).html 'OFF'
		else
			$(this).html 'ON'