class Orden < ActiveRecord::Base

	belongs_to :clienta
	has_many   :abonos
	
	has_many   :prendas, :dependent => :destroy
	accepts_nested_attributes_for :prendas, allow_destroy: true, update_only: true

	# los tres siguientes dos metodos se usan en ordenes#show para cerrar las ordenes. 

	def total_abonado
		total = 0
		self.abonos.each do |abono|
			total += abono.valor
		end
		total
	end

	def cerrar
		if self.valor_total <= self.total_abonado
			self.cerrada = true
			self.save
		end
	end

	def cerrable?
		if self.valor_total <= self.total_abonado
			true
		else
			false
		end
	end
	
end
