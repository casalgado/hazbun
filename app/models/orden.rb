class Orden < ActiveRecord::Base

	belongs_to :clienta
	has_many   :abonos
	
	has_many   :prendas, :dependent => :destroy
	accepts_nested_attributes_for :prendas, allow_destroy: true, update_only: true
	
end
