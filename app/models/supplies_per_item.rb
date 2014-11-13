class SuppliesPerItem < ActiveRecord::Base

		belongs_to :item
		belongs_to :supply
end
