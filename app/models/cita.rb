class Cita < ActiveRecord::Base

	belongs_to :orden
	belongs_to :tipodecita
	

	# Para mostrar las citas del dia 

	def self.de_hoy
		Cita.where(fecha: Time.now.beginning_of_day..Time.now.end_of_day)

	end


end
