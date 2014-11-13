class SuppliesPerItem < ActiveRecord::Base

	  # Associations

		belongs_to :item
		belongs_to :supply

		# Validations

		validates :quantity, numericality:  { message: "Cantidad debe ser un numero" }

end
