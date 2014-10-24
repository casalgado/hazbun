class String
	
	# Este metodo es para cambiar el orden del dia y el mes en el formato de date elegido por Datepicker

	def change_date_format
		new_string = self.clone
		new_string[0..1] = self[3..4]
		new_string[3..4] = self[0..1]
		new_string
	end


end