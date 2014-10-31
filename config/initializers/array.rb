class Array

	# para convertir un array de citas a un formato que fullcalendar.js entienda

	def to_fullcalendar
		fullcalendar = []
		self.each do |cita|
			fullcalendar << cita.to_event_format
		end
		fullcalendar
		
	end




end