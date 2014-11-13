class Supply < ActiveRecord::Base
	
	# Associations

	has_many :supplies_per_items
	has_many :itmes, through: :supplies_per_items

	# Validations

	# Methods

	def self.load
		supply_names = ['chiffon', 'tafeta', 'seda', 'drill', 'lino']
		color        = ['azul', 'verde', 'rojo']
		supply_names.each do |supply|
			Supply.create(:supply_name => supply, :supply_color => 'azul', :supply_type => 'tela')
		end
	end

end
