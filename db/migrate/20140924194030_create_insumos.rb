class CreateInsumos < ActiveRecord::Migration
  def change
    create_table :insumos do |t|
      t.string :tipo_de_insumo
      t.integer :cantidad

      t.timestamps
    end
  end
end
