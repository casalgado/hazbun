class Material < ActiveRecord::Base

		has_many :materiales_por_prenda
		has_many :items, through: :materiales_por_prenda

end
