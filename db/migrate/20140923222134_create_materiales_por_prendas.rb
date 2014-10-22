class CreateMaterialesPorPrendas < ActiveRecord::Migration
  def change
    create_table :materiales_por_prendas do |t|
			t.belongs_to :prenda
      t.belongs_to :material

      t.timestamps
    end
  end
end
