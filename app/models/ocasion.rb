class Ocasion < ActiveRecord::Base

	# Associations:

	has_many :items

	# Validations:

	validates :ocasion, presence: true

	# Methods:

	# Defult loader, se usa en sampe_data.rake

	def self.load
		ocasiones = ['Grado', 'Matrimonio', 'Quinceañero', 'Coctel',]
    ocasiones.each do |ocasion|
    Ocasion.new(:ocasion => ocasion).save
    end
	end

end
