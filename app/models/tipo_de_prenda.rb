class TipoDePrenda < ActiveRecord::Base

	has_many :prendas

	def self.load
		prendas = ['Vestido Corto', 'Vestido Largo', 'Blusa', 'Falda', 'Pantalon', 'Novia']
		prendas.each do |prenda|
			TipoDePrenda.new(:tipo_de_prenda => prenda).save
		end
	end


	
end
