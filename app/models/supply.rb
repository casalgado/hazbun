class Supply < ActiveRecord::Base
	
	# Associations

	belongs_to :item

	# Validations

	validates :quantity, numericality:  { message: "Cantidad debe ser un numero" }

	# Methods
end
