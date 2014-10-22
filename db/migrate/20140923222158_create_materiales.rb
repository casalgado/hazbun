class CreateMateriales < ActiveRecord::Migration
  def change
    create_table :materiales do |t|
    	t.belongs_to :tipo_de_material
    	t.belongs_to :color
      t.timestamps
    end
  end
end
