class Orden < ActiveRecord::Base

	# Associations:

	belongs_to :clienta
	has_many   :abonos
	
	has_many   :prendas, :dependent => :destroy
	accepts_nested_attributes_for :prendas, allow_destroy: true, update_only: true

	# Validations: 

	validates_uniqueness_of :cerrada, scope: :clienta_id, message: "Clienta ya tiene una orden abierta"

	# Scopes:

	# Uploader:

	# Methods:

	# los 3 siguientes dos metodos se usan en ordenes#show para cerrar las ordenes. 

	def total_abonado
		total = 0
		self.abonos.each do |abono|
			total += abono.valor
		end
		total
	end

	def cerrar
		self.cerrada = true
		self.save
	end

	def cerrable?
		if self.valor_total == nil
			true
		else
			if self.valor_total <= self.total_abonado
				true
			else
				false
			end
		end
	end

	# (1) para calcular si tiene y cuando es la proxima cita

	def next_appointment
		appointment = self.clienta.citas.last || nil
		if appointment && appointment.fecha >= Date.today
			appointment
		end
	end

	
end
