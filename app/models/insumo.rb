class Insumo < ActiveRecord::Base
	
	# Associations

	belongs_to :item

	# Validations

	validates :cantidad, numericality:  { message: "Cantidad debe ser un numero" }

	# Methods
end
