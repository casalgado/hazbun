class MaterialesPorPrenda < ActiveRecord::Base

		belongs_to :prenda
		belongs_to :material
end
