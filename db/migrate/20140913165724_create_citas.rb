class CreateCitas < ActiveRecord::Migration
  def change
    create_table :citas do |t|
    	t.belongs_to :prenda
    	t.belongs_to :clienta
    	t.belongs_to :tipo_de_cita
      t.datetime   :fecha

      t.timestamps
    end
  end
end
