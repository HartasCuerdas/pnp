$ ->
	well_registered_buttons = $ '.btn-enable-day'
	well_registered_buttons.on "ajax:success", (e, data, status, xhr) ->
		$(this)
			.toggleClass 'btn-success'
			.toggleClass 'btn-default'
			.closest('tr').effect("highlight", {}, 1500)
		if $(this).text() == 'Poor'
			$(this).html 'Well'
		else
			$(this).html 'Poor'