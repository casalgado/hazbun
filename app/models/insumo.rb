class Insumo < ActiveRecord::Base
	
	# Associations

	belongs_to :prenda

	# Validations

	validates :cantidad, numericality:  { message: "Cantidad debe ser un numero" }

	# Methods
end
