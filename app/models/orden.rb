class Orden < ActiveRecord::Base

	belongs_to :clienta
	has_many   :citas
	has_many   :abonos
	
end
