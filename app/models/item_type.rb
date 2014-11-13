class ItemType < ActiveRecord::Base

	has_many :items

	def self.load
		items = ['Vestido Corto', 'Vestido Largo', 'Blusa', 'Falda', 'Pantalon', 'Novia']
    items.each do |item|
    ItemType.new(:item_type => item).save
    end
	end


	
end
