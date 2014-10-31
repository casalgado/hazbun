class Cita < ActiveRecord::Base

	
	belongs_to :clienta
	belongs_to :tipo_de_cita
	belongs_to :prenda
	

	# Para mostrar las citas del dia 

	def self.de_hoy
		Cita.where(fecha: Time.now.beginning_of_day..Time.now.end_of_day)
	end

	# (2) Para meter al array que va a .js (se usa en static_pages#calendario)

	def to_event_format
		event = {title: self.clienta.nombre_completo, start: self.fecha, end: self.fecha, backgroundColor: self.backgroundcolor, borderColor: self.backgroundcolor}
		event
	end

	def backgroundcolor
		color = '#88c656' if self.tipo_de_cita_id == 1
		color = '#f9ab53' if self.tipo_de_cita_id == 2
		color = '#ec7151' if self.tipo_de_cita_id == 3
		color = '#28abdb' if self.tipo_de_cita_id == 4
		color
	end


end

