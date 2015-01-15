class AddBrandIdToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :brand_id, :integer
  end
end
