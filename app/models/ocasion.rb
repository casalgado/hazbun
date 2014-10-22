class Ocasion < ActiveRecord::Base

	has_many :prendas

	def self.load
		ocasiones = ['Grado', 'Matrimonio', 'Quinceañero', 'Coctel',]
		ocasiones.each do |ocasion|
			Ocasion.new(:ocasion => ocasion).save
		end
	end

end
