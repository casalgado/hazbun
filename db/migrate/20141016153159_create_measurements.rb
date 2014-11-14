class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
    	t.belongs_to :customer
    	t.string :talle_frente
    	t.string :talle_espalda
    	t.string :imperio
    	t.string :contorno
    	t.string :espalda
    	t.string :busto
    	t.string :cintura
    	t.string :cadera
    	t.string :costado
    	t.string :cotilla
    	t.string :hombro
      t.timestamps
    end
  end
end
