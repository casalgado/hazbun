class AddBelongsToInsumos < ActiveRecord::Migration
  def change
  	add_column :insumos, :item_id, :integer
  end
end
