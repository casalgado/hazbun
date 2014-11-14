class Occasion < ActiveRecord::Base

	# Associations:

	has_many :items

	# Validations:

	validates :occasion, presence: true

	# Methods:


end
