class AddBelongsToInsumos < ActiveRecord::Migration
  def change
  	add_column :insumos, :prenda_id, :integer
  end
end
