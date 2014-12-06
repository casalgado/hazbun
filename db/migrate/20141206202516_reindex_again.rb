class ReindexAgain < ActiveRecord::Migration
	def change
		remove_index :customers, :email
	  add_index :customers, [:email, :brand_id], :unique => true
	end
end
