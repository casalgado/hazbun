class Occasion < ActiveRecord::Base

	# Associations:

	has_many :items

	# Validations:

	validates :occasion, presence: true

	# Methods:

	# Defult loader, se usa en sampe_data.rake

	def self.load
		occasions = ['Grado', 'Matrimonio', 'Quinceañero', 'Coctel',]
    occasions.each do |occasion|
    Occasion.new(:occasion => occasion).save
    end
	end

end
