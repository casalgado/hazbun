class Cita < ActiveRecord::Base

	
	belongs_to :clienta
	belongs_to :tipo_de_cita
	belongs_to :prenda
	

	# Para mostrar las citas del dia 

	def self.de_hoy
		Cita.where(fecha: Time.now.beginning_of_day..Time.now.end_of_day)
	end


end

