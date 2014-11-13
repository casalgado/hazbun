class MaterialesPorPrenda < ActiveRecord::Base

		belongs_to :item
		belongs_to :material
end
