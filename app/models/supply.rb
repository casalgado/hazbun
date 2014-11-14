class Supply < ActiveRecord::Base
	
	# Associations

	has_many :supplies_per_items
	has_many :itmes, through: :supplies_per_items

	# Validations

	# Methods


end
