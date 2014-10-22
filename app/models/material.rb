class Material < ActiveRecord::Base

		has_many :materiales_por_prenda
		has_many :prendas, through: :materiales_por_prenda

end
