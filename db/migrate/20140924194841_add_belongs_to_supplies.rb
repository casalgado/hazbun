class AddBelongsToSupplies < ActiveRecord::Migration
  def change
  	add_column :supplies, :item_id, :integer
  end
end
