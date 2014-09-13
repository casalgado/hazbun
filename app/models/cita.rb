class Cita < ActiveRecord::Base

	belongs_to :orden
	belongs_to :tipodecita

	# Para mostrar las citas del dia 

	def de_hoy


	end


end
